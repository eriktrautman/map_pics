class FlickrPhotosController < ApplicationController
  def index
  end

  def next_photo
  end

  def previous_photo
  end

  def new_set
    lat, lon = params[:lat].to_i, params[:lng].to_i
    session[:page], session[:img_no] = nil, nil
    
    begin
      user = User.find(session[:user_id])
    rescue
      user = User.create
      session[:user_id] = user.id
    end

    user.new_photo_set(lat, lon)

    photo = user.photo_urls.first
    puts photo.inspect
    puts photo
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

    render :json => user.photo_urls.first
  end
end
