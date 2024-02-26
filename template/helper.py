import requests
import jinja2
import hashlib
import os

# Function to calculate SHA256 checksum
def calculate_sha256(url):
    response = requests.get(url, stream=True)
    sha256_hash = hashlib.sha256()
    for chunk in response.iter_content(chunk_size=1024):
        sha256_hash.update(chunk)
    return sha256_hash.hexdigest()

# GitHub API headers
headers = {
    'Authorization': f'token {os.environ["GH_TOKEN"]}',
    'Accept': 'application/vnd.github.v3+json',
}

# Fetch the latest release information
response = requests.get('https://api.github.com/repos/streamdal/streamdal/releases', headers=headers)
releases = response.json()
latest_release = next((release for release in releases if release['tag_name'].startswith('apps/cli') and not release['draft']), None)
latest_version = latest_release['tag_name'].split('/')[-1]
latest_id = latest_release['id']
latest_cli = latest_release

assets = latest_cli['assets']
asset_info = {}
for asset in assets:
   name = asset['name']
   print(name)
   download_url = asset['browser_download_url']
   sha256 = calculate_sha256(download_url)
   asset_info[name] = {'url': download_url, 'sha256': sha256}

# Assuming you know the naming convention of your assets, you can map them correctly here
variables = {
    'macos_arm_url': asset_info.get('streamdal-darwin-arm64', {}).get('url', ''),
    'macos_arm_sha256': asset_info.get('streamdal-darwin-arm64', {}).get('sha256', ''),
    'macos_intel_url': asset_info.get('streamdal-darwin', {}).get('url', ''),
    'macos_intel_sha256': asset_info.get('streamdal-darwin', {}).get('sha256', ''),
    'linux_url': asset_info.get('streamdal-linux', {}).get('url', ''),
    'linux_sha256': asset_info.get('streamdal-linux', {}).get('sha256', '')
}

# Define your Jinja template with variables for URLs and SHA256 checksums
template_str = """
class Cli < Formula
  desc "Streamdal's CLI tool"
  homepage "https://github.com/streamdal/cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "{{ macos_arm_url }}"
      sha256 "{{ macos_arm_sha256 }}"
    else
      url "{{ macos_intel_url }}"
      sha256 "{{ macos_intel_sha256 }}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "{{ linux_url }}"
      sha256 "{{ linux_sha256 }}"
    else
      ohdie "Unsupported CPU architecture"
    end
  end

  def install
    on_macos do
      if Hardware::CPU.arm?
        bin.install "streamdal-darwin-arm64" => "streamdal-cli"
      else
        bin.install "streamdal-darwin" => "streamdal-cli"
      end
    end

    on_linux do
      bin.install "streamdal-linux" => "streamdal-cli"
    end
  end

  test do
    system "#{bin}/streamdal-cli --usage"
  end
end

"""

# Render the template
template = jinja2.Template(template_str)
rendered_template = template.render(**variables)

# Write the rendered template to the formula file
formula_path = 'homebrew-tap/cli.rb'  # Adjusted path to match the checkout path in the GitHub Action
with open(formula_path, 'w') as f:
    f.write(rendered_template)