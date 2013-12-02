require_relative 'load_houses'
require_relative 'home_purchase_option_class'

homes = LoadHouses.new
homes.load_houses('mortgage_prices.csv')

puts 'What is the address of the home you want to get insurence information for?'
address = gets.chomp

while true
  house = HomePurchaseOption.new(homes, address)
  if house.check_for_adress(address)
    house.display_address
    house.required_mortgage
    house.pmi_required?
    break
  end
  if house.check_for_adress(address) == false
    puts 'No homes for that address'
    address = gets.chomp
  end
  break if address.downcase == 'done'
end
if house.check_for_adress(address)
  puts "Do you want a quote on your insurence?"
  answer =gets.chomp
    if answer.downcase == 'yes'
      puts 'How many years'
      years = gets.chomp.to_i
      house.insurance_cost(years)
    end
end
