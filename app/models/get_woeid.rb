# This class gets the Where on Earth ID (WOEID)
# from Yahoo! GeoPlanet service

class GetWoeid
  def initialize
    
  end

  def self.getWOEID(txt)
   catchErr = 0

    #Declare Unique Application ID
    appid = '.QnbvMDV34H3CnkvR3vBMgB5l3e.lKkPp9gsWx8aS9YYHlLAlw8or6ZIJMH.sVPs7w--'

    #Strip trailing whitespaces and other chars
    txt = CGI::escape(txt)

    url = URI.parse('http://where.yahooapis.com/v1/places.q('+txt+')?appid='+appid)

    #Get the XML from Yahoo! GeoPlanet
    begin response = Net::HTTP.get_response(url).body
    rescue response = "Connection error."
    end

    #Extract woeid value
    doc = REXML::Document.new(response)

    #Catch Error if the result comes out nil
    catchErr = doc.root.attributes['yahoo:total'].to_i

    if catchErr < 1
      return []
    else
      woeid = REXML::XPath.match(doc,'//woeid')

      return woeid.join('').gsub(/<\/?[^>]*>/, '')
    end

  end
    
end
