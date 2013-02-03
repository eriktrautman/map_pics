class PhotoUrl < ActiveRecord::Base
  require 'addressable/uri'

  attr_accessible :url, :user_id

  belongs_to :user

  # flickr API Key
  API_KEY = '8eb26ba8751ffd4c9c3e4630bd265de8'
  # flickr Secret: e6fc05979fcd5c13

  class << self
    def get_photos(lat = '37.771258', lon = '-122.420654', page = 1)
      photos = JSON.parse(get_flickr_data(lat, lon, page))
      photo_urls = photos['photos']['photo'].map do |photo_data|
        build_image_url(photo_data)
      end
    end

    def get_flickr_data(lat, lon, page)
      flickr_url = build_flickr_url(lat, lon, page)
      RestClient.get(flickr_url)
    end

    def build_flickr_url(lat, lon, page)
      flickr_options = {
        :method=> 'flickr.photos.search',
        :api_key => API_KEY,
        :content_type => 1,  # (photos only)
        :sort => 'interestingness-desc',
        :lat => lat,
        :lon => lon,
        :radius => 30,   # (in km)
        :page => page,
        :format => 'json',
        :nojsoncallback => 1
      }

      flickr_url = Addressable::URI.new(
        scheme: "http",
        host: "api.flickr.com",
        path: "services/rest",
        query_values: flickr_options
      ).to_s
    end

    def build_image_url(photo_data)
      farm_id = photo_data["farm"]
      server_id = photo_data["server"]
      id = photo_data["id"]
      secret = photo_data["secret"]
      "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_b.jpg"
    end
  end
end
