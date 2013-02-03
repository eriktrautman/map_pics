class FlickrPhotosController < ApplicationController
  def next_photo
  end

  def previous_photo
  end

  def new_set
    puts "THIS HAPPENED"
    a = "this is a string"
    render :json => a.to_json
    #render :js => "alert('Hello Rails');"
  end
end
