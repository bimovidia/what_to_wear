require 'cgi'
require 'net/http'
require 'rexml/document'

class HomeController < ApplicationController

  def index
    @title = "Home"

    #Instantiate variables
    @weather = Weather.new

    if !params[:search].nil?
      search = params[:search]

      @woeid = GetWoeid.getWOEID(search)
      
      if !@woeid.empty?
        @weather = GetWeather.getWeather(@woeid)

        if @weather.temp.blank?
          @infoText = "Please be more specific!"
        else
          @menWear = GetClothing.menWear(@weather)
          @womenWear = GetClothing.womenWear(@weather)
        end
        
      else
        @infoText = "Place cannot be found. Please try again!"
      end
      
    end

  end

end
