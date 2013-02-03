class FlickrPhotosController < ApplicationController
  def next_photo
  end

  def previous_photo
  end

  def new_set
    lat, lon = params[:lat], params[:lng]
    session[:page], session[:img_no] = nil, nil
    
    if session[:user_id]
      user = User.find(session[:user_id])
    else
      user = User.create
      session[:user_id] = user.id
    end

    user.new_photo_set(lat, lon)
  end
end
