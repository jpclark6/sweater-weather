class Api::V1::ImagesController < ApplicationController
  def show
    @url = FlickrService.new(params[:location]).find_picture_url
    render json: {url: @url}
  end
end