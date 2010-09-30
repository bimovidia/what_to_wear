# This Class gets the weather data
# from Yahoo! Weather web service

class GetWeather
  def initialize
    
  end

  def getWeather(woeid)
    city = region = country = chill = direction = speed = humidity = visibility = pressure = rising = code = text = temp = Array.new
    weather = location = wind = atmosphere = condition = Array.new
    url = URI.parse('http://weather.yahooapis.com/forecastrss?w='+woeid)

    #Get the XML from Yahoo! GeoPlanet
    begin response = Net::HTTP.get_response(url).body
    rescue response = "Connection error."
    end

    doc = REXML::Document.new(response)

    yweather = REXML::XPath.match(doc,"//yweather:*")

    yweather.each do |line|

      if !line.attributes['city'].nil? then city = line.attributes['city'] end
      if !line.attributes['region'].nil? then region = line.attributes['region'] end
      if !line.attributes['country'].nil? then country = line.attributes['country'] end

      if !line.attributes['chill'].nil? then chill = line.attributes['chill'] end
      if !line.attributes['direction'].nil? then direction = line.attributes['direction'] end
      if !line.attributes['speed'].nil? then speed = line.attributes['speed'] end

      if !line.attributes['humidity'].nil? then humidity = line.attributes['humidity'] end
      if !line.attributes['visibility'].nil? then visibility = line.attributes['visibility'] end
      if !line.attributes['pressure'].nil? then pressure = line.attributes['pressure'] end
      if !line.attributes['rising'].nil? then rising = line.attributes['rising'] end

      if !line.attributes['code'].nil? then code = line.attributes['code'] end
      if !line.attributes['text'].nil? then text = line.attributes['text'] end
      if !line.attributes['temp'].nil? then temp = line.attributes['temp'] end

    end

    weather << :city << city << :region << region << :country << country << :chill << chill << :direction << direction << :speed << speed << :humidity << humidity << :visibility << visibility << :pressure << pressure << :rising << rising << :code << code << :text << text << :temp << temp
    weather = Hash[*weather.flatten]

    return weather

  end
  
end
