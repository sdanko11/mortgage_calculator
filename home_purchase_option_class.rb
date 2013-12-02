class HomePurchaseOption

  attr_reader :possible_homes

  def initialize(house_data, home_adress)
    @possible_homes = house_data
    @home_adress = home_adress
  end

  def display_address
    puts "*********#{@home_adress}**********"
  end
  
  def equity_after_sale
    @possible_homes.homes.each do |home|
    if @home_adress == home[:adress]
      equity_due = (home[:property_value] - (home[:selling_price] - home[:down_payment]))
      puts "#{equity_due}"
    end
  end
end

  def required_mortgage
    @possible_homes.homes.each do |home|
      if @home_adress == home[:adress]
          mortgage = (home[:selling_price] - home[:down_payment])
          puts "Mortgage: #{mortgage}"
        end
      end
    end

  def insurance_cost(years)
    @possible_homes.homes.each do |home|
      if @home_adress == home[:adress]
          insurance_total = ((home[:selling_price]-home[:down_payment])*(0.05*years))
            puts "#{years} years of Insurence: #{insurance_total}"
      end
    end
  end

  def pmi_required?
    @possible_homes.homes.each do |home|
      if @home_adress == home[:adress]
        percent_of_home_owned = (home[:down_payment].to_f/home[:property_value].to_f)
          if percent_of_home_owned > 0.20
          puts 'You dont need insurence'
        else
          puts 'Insurence Required'
        end
      end
    end
  end
    
end