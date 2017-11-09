require_relative 'test_helper'
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"

class MerchantTest < Minitest::Test

  def test_it_exists
    se = SalesEngine.from_csv({
      :items         => "./data/items.csv",
      :merchants     => "./data/merchants.csv",
      :invoices      => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions  => "./data/transactions.csv",
      :customers     => "./data/customers.csv"
    })

    mr = MerchantRepository.new(se, "./data/merchants.csv")
    merchant = Merchant.new({id: 12334105, name: "Shopin1901", created_at: "2010-12-10", updated_at: "2011-12-04"}, mr)

    assert_instance_of Merchant, merchant
  end

  def test_it_has_attributes
    se = SalesEngine.from_csv({
      :items         => "./data/items.csv",
      :merchants     => "./data/merchants.csv",
      :invoices      => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions  => "./data/transactions.csv",
      :customers     => "./data/customers.csv"
    })

    mr = MerchantRepository.new(se, "./data/merchants.csv")
    merchant = Merchant.new({id: 12334105, name: "Shopin1901", created_at: "2010-12-10", updated_at: "2011-12-04"}, mr)

    assert_equal 12334105, merchant.id
    assert_equal "Shopin1901", merchant.name
  end
end
