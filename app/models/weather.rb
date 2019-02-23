class Weather
  def initialize(data)
    @data = data
  end

  def current_temp
    current[:temperature]
  end

  def current_feels_like
    current[:apparentTemperature]
  end

  def current_humidity
    current[:humidity]
  end

  def current_visibility_mi
    current[:visibility]
  end

  def current_uv_index
    current[:uvIndex]
  end

  def current_status
    current[:summary]
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
    daily[:data][days_in_future][:summary]
  end

  private

  def current
    @data[:currently]
  end

  def daily
    @data[:daily]
  end
end