require_relative 'sales_engine'
require_relative 'sales_analyst'

se = SalesEngine.from_csv({
  :items         => "./data/items.csv",
  :merchants     => "./data/merchants.csv",
  :invoices      => "./data/invoices.csv",
  :invoice_items => "./data/invoice_items.csv",
  :transactions  => "./data/transactions.csv",
  :customers     => "./data/customers.csv"
})

# se = SalesEngine.from_csv({
#   :items     => "./test/fixtures/items_truncated.csv",
#   :merchants => "./test/fixtures/merchants_truncated.csv",
#   :invoices => "./test/fixtures/invoices_truncated.csv",
#   :invoice_items => "./test/fixtures/invoice_items_truncated.csv",
#   :transactions  => "./data/transactions.csv",
#   :customers     => "./data/customers.csv"
# })

sa = SalesAnalyst.new(se)

date = Time.parse("2009-02-07")

p sa.valid_inv_grouped_by_merchant.count

# first - 12334634, 212,XXX revenue
# last - 12334159
#invoice_count 2810
