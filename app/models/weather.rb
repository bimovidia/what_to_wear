# To change this template, choose Tools | Templates
# and open the template in the editor.

class Weather

  attr_accessor :city, :region, :country, :chill, :direction, :speed, :humidity, :visibility, :pressure, :rising, :code, :text, :temp, :description

  def initialize()
    @city = ""
    @region = ""
    @country = ""
    @chill = ""
    @direction = ""
    @speed = ""
    @humidity = ""
    @visibility = ""
    @pressure = ""
    @rising = ""
    @code = ""
    @text = ""
    @temp = ""
    @description = ""
  end
end
