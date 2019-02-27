class Weather
  def initialize(data)
    @data = data
  end

  def current
    { 
      time: current_time,
      temperature: current_temp,
      feels_like: current_feels_like,
      humidity: current_humidity,
      visibility: current_visibility_mi,
      uv_index: current_uv_index,
      description: current_status, 
      icon: current_icon
    }
  end

  def hourly_weather
    hourly_forecast = []
    24.times do |hour|
      hourly_forecast[hour] = {
                                time: hourly_time(hour),
                                temperature: hourly_temperature(hour)
                              }
    end
    hourly_forecast
  end

  def daily_weather
    daily_forecast = []
    7.times do |day|
      daily_forecast[day] = {
                    time: daily_time(day),
                    high: high(day),
                    low: low(day),
                    status: status(day),
                    tonight_status: tonight_status(day),
                    humidity: humidity(day),
                    icon: icon(day)
                   }
    end
    daily_forecast
  end

  def current_temp
    currently[:temperature]
  end

  def current_feels_like
    currently[:apparentTemperature]
  end

  def current_humidity
    currently[:humidity]
  end

  def current_visibility_mi
    currently[:visibility]
  end

  def current_uv_index
    currently[:uvIndex]
  end

  def current_status
    currently[:summary]
  end

  def current_time
    currently[:time]
  end

  def current_icon
    currently[:icon]
  end

  def hourly_time(hours_in_future = 0)
    hourly[:data][hours_in_future][:time]
  end

  def hourly_temperature(hours_in_future = 0)
    hourly[:data][hours_in_future][:temperature]
  end

  def daily_time(days_in_future = 0)
    daily[:data][days_in_future][:time]
  end

  def high(days_in_future = 0)
    daily[:data][days_in_future][:temperatureHigh]
  end

  def low(days_in_future = 0)
    daily[:data][days_in_future][:temperatureLow]
  end

  def status(days_in_future = 0)
    daily[:data][days_in_future][:summary]
  end

  def tonight_status(days_in_future = 0)
    daily[:data][days_in_future][:summary] #not quite true
  end

  def humidity(days_in_future = 0)
    daily[:data][days_in_future][:humidity]
  end

  def icon(days_in_future = 0)
    daily[:data][days_in_future][:icon]
  end

  private

  def currently
    @data[:currently]
  end

  def hourly
    @data[:hourly]
  end

  def daily
    @data[:daily]
  end
end