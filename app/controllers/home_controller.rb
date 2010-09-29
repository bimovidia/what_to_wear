class HomeController < ApplicationController

  def index
    @title = "Home"
    @weather = Array.new
    @errText = String.new

    if !params[:search].nil?
      search = params[:search]

      @woeid = getWOEID(search)
      if !@woeid.empty?
        @weather = getWeather(@woeid)
      else
        @errText = "Place cannot be found. Please try again!"
      end
      
    end

  end

end
