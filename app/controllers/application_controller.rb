require 'cgi'
require 'net/http'
require 'rexml/document'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def getWOEID(txt)

    catchErr = 0

    #Declare Unique Application ID
    appid = '.QnbvMDV34H3CnkvR3vBMgB5l3e.lKkPp9gsWx8aS9YYHlLAlw8or6ZIJMH.sVPs7w--'

    #Strip trailing whitespaces and other chars
    txt = CGI::escape(txt)

    url = URI.parse('http://where.yahooapis.com/v1/places.q('+txt+')?appid='+appid)

    response = getResponseURL(url)

    # extract woeid value
    doc = REXML::Document.new(response)
    catchErr = doc.root.attributes['yahoo:total'].to_i

    if catchErr < 1
      return []
    else
      woeid = REXML::XPath.match(doc,'//woeid')

      return woeid.join('').gsub(/<\/?[^>]*>/, '')
    end  

  end

  def getWeather(woeid)
    city = region = country = chill = direction = speed = humidity = visibility = pressure = rising = code = temp = Array.new
    weather = location = wind = atmosphere = condition = Array.new
    url = URI.parse('http://weather.yahooapis.com/forecastrss?w='+woeid)

    response = getResponseURL(url)

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

  def getResponseURL(url)
    begin
      xml = Net::HTTP.get_response(url).body
    rescue
      xml = "Connection error."
    end

    return xml
  end
end
