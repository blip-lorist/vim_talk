require 'minitest/autorun'
require_relative 'image_downloader'

class TestImageDownloader < Minitest::Test

  def test_it_returns_a_wikipedia_image_url
		image_url = ImageDownloader.get_image_url_for("Frida Kahlo")
    assert(image_url.include?("Frida_Kahlo"))
  end
end

# It takes in a wikipedia title, returns a URL


# It takes a URL and downloads an image to provided destination
