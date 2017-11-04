require_relative 'test_helper'
require_relative "../lib/item_repo"
require_relative "../lib/sales_engine"

class ItemRepoTest < Minitest::Test

  def test_it_initializes
    assert_instance_of ItemRepository, ItemRepository.new(self, "./data/items.csv")
  end

  def test_it_can_create_item_instances
    item_repo = ItemRepository.new(self, "./data/items.csv")

    assert_instance_of Item, item_repo.items.first
  end

  def test_it_can_reach_the_item_instances_through_all
    item_repo = ItemRepository.new(self, "./data/items.csv")

    assert_instance_of Item, item_repo.all.first
  end

  def test_it_can_find_items_by_id
    item_repo = ItemRepository.new(self, "./data/items.csv")
    results = item_repo.find_by_id(263396013)

    assert_equal "Free standing Woden letters", results.name
  end

  def test_it_can_find_items_by_name
    item_repo = ItemRepository.new(self, "./data/items.csv")
    results = item_repo.find_by_name('Free standing Woden letters')

    assert_equal 263396013, results.id
  end

  def test_find_by_name_can_return_an_empty_array
    item_repo = ItemRepository.new(self, "./data/items.csv")
    results = item_repo.find_by_name('Not A Real Product')

    assert_nil results
  end

  def test_it_can_find_items_by_description
    item_repo = ItemRepository.new(self, "./data/items.csv")
    description = "Free standing wooden letters \n\n15cm\n\nAny colours"
    results = item_repo.find_all_with_description(description)

    assert_equal 263396013, results.first.id
  end

  def test_it_can_find_all_by_merchant_id
    item_repo = ItemRepository.new(self, "./data/items.csv")
    results = item_repo.find_all_by_merchant_id(12334326)

    assert_equal 6, results.count
  end

  def test_it_can_find_all_by_price_in_range
    item_repo = ItemRepository.new(self, "./data/items.csv")

    assert_equal 910, item_repo.find_all_by_price_in_range(10..150).count
    assert_equal 19, item_repo.find_all_by_price_in_range(1000..1500).count
  end

  def test_can_find_by_price
    item_repo = ItemRepository.new(self, "./data/items.csv")
    results  = item_repo.find_all_by_price(10)
    results2 = item_repo.find_all_by_price(25)

    assert_equal 63, results.count
    assert_equal 79, results2.count
    # assert_equal "510+ RealPush Icon Set", results.first.name
    # assert_equal "Hello There Shibori kitchen tea towel", results.last.name
  end
end
