module HomeHelper

  def displayLocation(weather)
    if !weather.region.blank?
      puts weather.city+ "," +weather.region+ ", " +weather.country
    else
      puts weather.city+ ", " +weather.country
    end
    
  end
end
