# To change this template, choose Tools | Templates
# and open the template in the editor.

class GetClothing
  def initialize

  end

  def self.menWear(weather)

    @men = ["men_winter.png", "men_jacket.png", "men_hoodie.png", "men_shirt.png", "men_short.png", "men_shoes.png", "men_swimwear.png"]
    @menwear = Array.new

    if weather.temp.to_i < 30
      @menwear << @men[0]
    elsif weather.temp.to_i.between?(29,39)
      @menwear << @men[1]
    elsif weather.temp.to_i.between?(40,50)
      @menwear << @men[2]
    elsif weather.temp.to_i.between?(51,75)
      @menwear << @men[3] << @men[4] << @men[5]
    else
      @menwear << @men[6]
    end

    return @menwear

  end

  def self.womenWear(weather)

    @women = ["women_winter.png", "women_hoodie.png", "women_shirt.png", "women_short.png", "women_shoes.png", "women_swimwear.png", "women_bikini.png"]
    @womenwear = Array.new

    if weather.temp.to_i < 30
      @womenwear << @women[0]
    elsif weather.temp.to_i.between?(29,39)
      @womenwear << @women[1]
    elsif weather.temp.to_i.between?(40,50)
      @womenwear << @women[1]
    elsif weather.temp.to_i.between?(51,75)
      @womenwear << @women[2] << @women[3] << @women[4]
    else
      @womenwear << @women[5] << @women[6]
    end

    return @womenwear

  end

end
