require 'httparty'
class ImageDownloader
  def self.get_image_url_for(article_name)
    article_name = article_name.gsub(" ","_")
    reponse = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&titles=#{article_name}&prop=pageimages&format=json&pithumbsize=500")
    response_hash = JSON.parse(response.body)
    first_page, image_info  = reponse_hash["query"]["pages"].first

    # TODO: Need to fix this
    image_url = image_info["thumbnail"]["url"]
  end

  def self.download_image(image_url, filename)
    response = HTTParty.get(image_url)
		File.open(filename, "w") do |file|
      file.write(reponse.body)
    end
  end

  def self.download_wikipedia_image_for(search_term)
    image_url = self.get_image_url_for(search_term)
    filename = search_term.gsub(" ","_").downcase
    self.download_image(image_url, filename)
  end
end
