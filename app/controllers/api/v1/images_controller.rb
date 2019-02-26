class Api::V1::ImagesController < Api::ApiController
  def show
    @url = FlickrService.new(params[:location]).find_picture_url
    render json: {url: @url}
  end
end