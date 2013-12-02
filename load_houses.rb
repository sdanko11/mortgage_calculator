require 'csv'
class LoadHouses

  attr_reader :homes

  def initialize
    @homes=[]
  end

  def load_houses(file_name)
    CSV.foreach(file_name, :headers => true) do |row|
      house = {}
      house = {:adress => row["Adress"],
              :property_value => row["Property Value"].to_i,
              :selling_price => row["Selling Price"].to_i,
              :down_payment => row["Down Payment"].to_i}
      @homes << house
    end
  end
end