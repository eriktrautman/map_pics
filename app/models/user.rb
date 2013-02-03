class User < ActiveRecord::Base
  has_many :photo_urls

  def new_photo_set(lat, lon)
    # Delete all but last 10 photos
    photo_urls[0..-10]
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
