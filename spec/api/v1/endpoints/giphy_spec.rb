require 'rails_helper'

describe 'getting giphy weather json' do
  it 'can send an api request and get gifs based on the weather as a response', :vcr do
    get '/api/v1/gifs', params: {location: "denver,co"}

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

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
  end

  it 'can send an api request of another city and get gifs based on the weather as a response', :vcr do
    get '/api/v1/gifs', params: {location: "miami,fl"}

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

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
  end
end