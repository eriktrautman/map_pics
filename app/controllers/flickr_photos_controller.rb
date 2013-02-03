class FlickrPhotosController < ApplicationController
  before_filter :find_or_create_user

  def index
  end

  def random
    render :json => @user.photo_urls.sample
  end

  def new_set
    lat, lon = params[:lat].to_f, params[:lng].to_f
    @user.new_photo_set(lat, lon, 1)
    render :json => @user.photo_urls.sample
  end

  private
  def find_or_create_user
    @user = User.find_or_create_by_id(session[:user_id])
    session[:user_id] = @user.id
  end
end
