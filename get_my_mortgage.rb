require_relative 'load_houses'
require_relative 'home_purchase_option_class'

homes = LoadHouses.new
homes.load_houses('mortgage_prices.csv')

puts 'What is the address of the home you want to get insurence information for?'
address = gets.chomp

house = HomePurchaseOption.new(homes, address)
house.display_address
house.required_mortgage
house.pmi_required?

puts "How many years do you want for your insurence quote?"
quote =gets.chomp.to_i

house.insurance_cost(quote)