require_relative 'sales_engine'
require_relative 'sales_analyst'
require_relative "merchant_repo"

se = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})

sa = SalesAnalyst.new(se)

# m = MerchantRepository.new(self, "./data/merchants.csv")


# puts sa.golden_items
puts sa.golden_items
