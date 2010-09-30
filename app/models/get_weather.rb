# To change this template, choose Tools | Templates
# and open the template in the editor.

class GetWeather
  def initialize
    
  end

  def getWeather(woeid)
    city = region = country = chill = direction = speed = humidity = visibility = pressure = rising = code = temp = Array.new
    weather = location = wind = atmosphere = condition = Array.new
    url = URI.parse('http://weather.yahooapis.com/forecastrss?w='+woeid)

    #Get the XML from Yahoo! GeoPlanet
    begin response = Net::HTTP.get_response(url).body
    rescue response = "Connection error."
    end

    data = REXML::Document.new(response)

    location = REXML::XPath.match(data,'//yweather:location')
    location.each do |line|
      city = line.attributes['city']
      region = line.attributes['region']
      country = line.attributes['country']
    end

    wind = REXML::XPath.match(data,'//yweather:wind')
    wind.each do |line|
      chill = line.attributes['chill']
      direction = line.attributes['direction']
      speed = line.attributes['speed']
    end

    atmosphere = REXML::XPath.match(data,'//yweather:atmosphere')
    atmosphere.each do |line|
      humidity = line.attributes['humidity']
      visibility = line.attributes['visibility']
      pressure = line.attributes['pressure']
      rising = line.attributes['rising']
    end

    condition = REXML::XPath.match(data,'//yweather:condition')
    condition.each do |line|
      code = line.attributes['code']
      temp = line.attributes['temp']
    end

    weather << 'city' << city << 'region' << region << 'country' << country << 'chill' << chill << 'direction' << direction << 'speed' << speed << 'humidity' << humidity << 'visibility' << visibility << 'pressure' << pressure << 'rising' << rising << 'code' << code << 'temp' << temp
    weather = Hash[*weather.flatten]


    return weather

  end
  
end
