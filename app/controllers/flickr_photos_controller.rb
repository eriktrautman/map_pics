class FlickrPhotosController < ApplicationController
  before_filter :find_or_create_user

  def index
    
  end

  def next_photo
    photo_urls = @user.photo_urls

    if photo_urls.empty?
      redirect_to photos_index_path
    elsif session[:img_no] == (photo_urls.count - 1)
      session[:page] = session[:page].to_i + 1
      session[:img_no] = 11
      @user.next_photo_set(params[:lat], params[:lng], session[:page])
      render :json => @user.photo_urls[img_no]
    else
      session[:img_no] = session[:img_no].to_i + 1
      render :json => photo_urls[session[:img_no]]
    end
  end

  def previous_photo
    session[:img_no] = session[:img_no].to_i - 1
    render :json => @user.photo_urls[session[:img_no]]
  end

  def new_set
    lat, lon = params[:lat].to_f, params[:lng].to_f
    session[:page], session[:img_no] = 1, 0

    @user.new_photo_set(lat, lon, 1)

    render :json => @user.photo_urls.first
  end

  private

<<<<<<< HEAD
    photo = user.photo_urls.first
    puts photo.inspect
    puts photo
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

    render :json => user.photo_urls.first
=======
  def find_or_create_user
    @user = User.find_or_create_by_id(session[:user_id])
    session[:user_id] = @user.id
>>>>>>> 34a8a9b9314bf6cf90b84427c5bcaa10eae69e0c
  end
end
