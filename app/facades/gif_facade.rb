class GifFacade 
  def initialize(image_description)
    @image_description = image_description
    @_search_results = nil
  end

  def get_gif
    # random_image_data = search_results[:data].sample    # Makes VCR fail due to random image
    random_image_data = search_results[:data][0]
    random_image_data[:images][:original][:url]
  end

  private

  def search_results
    @_search_results ||= service.gif_data
  end

  def service
    GiphyService.new(@image_description)
  end
end