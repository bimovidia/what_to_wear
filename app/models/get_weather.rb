# This Class gets the weather data
# from Yahoo! Weather web service

class GetWeather
  
  def initialize
  end

  def self.getWeather(woeid)

    weather = Weather.new

    url = URI.parse('http://weather.yahooapis.com/forecastrss?w='+woeid)

    #Get the XML from Yahoo! GeoPlanet
    begin response = Net::HTTP.get_response(url).body
    rescue response = "Connection error."
    end

    doc = REXML::Document.new(response)
    yweather = REXML::XPath.match(doc,"//yweather:*")

    yweather.each do |line|

      if !line.attributes['city'].nil? then weather.city = line.attributes['city'] end
      if !line.attributes['region'].nil? then weather.region = line.attributes['region'] end
      if !line.attributes['country'].nil? then weather.country = line.attributes['country'] end

      if !line.attributes['chill'].nil? then weather.chill =  line.attributes['chill'] end
      if !line.attributes['direction'].nil? then weather.direction =  line.attributes['direction'] end
      if !line.attributes['speed'].nil? then weather.speed = line.attributes['speed'] end

      if !line.attributes['humidity'].nil? then weather.humidity = line.attributes['humidity'] end
      if !line.attributes['visibility'].nil? then weather.visibility = line.attributes['visibility'] end
      if !line.attributes['pressure'].nil? then weather.pressure = line.attributes['pressure'] end
      if !line.attributes['rising'].nil? then weather.rising = line.attributes['rising'] end

      if !line.attributes['code'].nil? then weather.code = line.attributes['code'] end
      if !line.attributes['text'].nil? then weather.text = line.attributes['text'] end
      if !line.attributes['temp'].nil? then weather.temp = line.attributes['temp'] end

    end

    if weather
      @ydesc = REXML::XPath.match(doc,"//description")

      weather.description = @ydesc[1].to_s.sub('<description><![CDATA[', '').sub(']]></description>', '')
    end

    return weather

  end
  
end
