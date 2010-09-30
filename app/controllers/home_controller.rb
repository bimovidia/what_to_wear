require 'cgi'
require 'net/http'
require 'rexml/document'

class HomeController < ApplicationController

  def index
    @title = "Home"

    #Instantiate variables
    @search = GetWoeid.new
    @getWeather = GetWeather.new

    @weather = Array.new
    @errText = String.new

    if !params[:search].nil?
      search = params[:search]

      @woeid = @search.getWOEID(search)
      
      if !@woeid.empty?
        @weather = @getWeather.getWeather(@woeid)
      else
        @errText = "Place cannot be found. Please try again!"
      end
      
    end

  end

end
