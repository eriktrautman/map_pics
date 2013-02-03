class User < ActiveRecord::Base
  has_many :photo_urls

  def next_photo_set(lat, lon, page)
    photo_urls[0..-11].destroy_all
    make_new_photos(lat, lon, page)
  end

  def new_photo_set(lat, lon, page = 1)
    photo_urls.destroy_all
    make_new_photos(lat, lon, page)
  end

  def make_new_photos(lat, lon, page)
    PhotoUrl.get_photos(lat, lon, page).each do |url|
      photo_urls.create(url: url)
    end
  end

  def next_photo_url(photo_num)
    # If empty
      # Fetch new urls
      # Save into database
      # Serve up first one
    # If last one
      # Delete all but last 10
      # Fetch new urls
      # Save into database
    # If in middle
      # Fetch user's photo urls
      # Select the next one array style
  end

  def previous_photo_url(photo_num)
    # If at beginning
      # Send same url
    # If in middle
      # Fetch photo urls
      # Select the previous one array style
  end
end