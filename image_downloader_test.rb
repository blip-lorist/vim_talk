require 'minitest/autorun'
require_relative 'image_downloader'

class TestImageDownloader < Minitest::Test

  # It takes in a wikipedia title, returns a URL
  def test_it_returns_a_wikipedia_image_url
    image_url = ImageDownloader.get_image_url_for("Frida Kahlo")
    assert(image_url.include?("Frida_Kahlo"))
  end

  # It takes a URL and downloads an image to provided destination
  def test_it_downloads_an_image
    article_name = "Frida Kahlo"
    image_url = ImageDownloader.get_image_url_for(article_name)
    filename = article_name.gsub(" ","_").downcase
    ImageDownloader.download_image(image_url, filename)
    assert(File.file?("./#{filename}"))
  end
end

