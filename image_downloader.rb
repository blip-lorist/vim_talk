require 'httparty'
class ImageDownloader
  def self.get_image_url_for(article_name)
    article_name = article_name.gsub(" ","_")
    response = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&titles=#{article_name}&prop=pageimages&format=json&pithumbsize=500")
    response_hash = JSON.parse(response.body)
    first_page, image_info  = response_hash["query"]["pages"].first
    image_url = image_info["thumbnail"]["source"]
  end
end
