require 'rails_helper'

describe 'getting giphy images' do
  it 'can send an api request and get gifs based on the weather as a response' do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)
    binding.pry

    expect(data[:data].keys).to include(:images)
    expect(data[:data][:images][0].keys).to include(:time)
    expect(data[:data][:images][0][:time].to_i).to be > 1
    expect(data[:data][:images][0].keys).to include(:summary)
    expect(data[:data][:images][0].keys).to include(:url)
    expect(data[:data][:images][0][:url]).to include('.gif')

    expect(data[:data][:images][6].keys).to include(:time)
    expect(data[:data][:images][6].keys).to include(:summary)
    expect(data[:data][:images][6].keys).to include(:url)
    expect(data[:data][:images][6][:url]).to include('.gif')

    expect(data[:copyright]).to eq('2019')

#     {
#   data: {
#     images: [
#       {
#         time: "1541487600",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541127600",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "2381487600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]     
#   }
#   copyright: "2019"
# }

#     `/api/v1/gifs?location=denver,co`
  end
end