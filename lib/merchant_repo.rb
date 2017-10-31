require './lib/merchant'
require 'pry'
require 'csv'

class MerchantRepository
  attr_reader :merchant_csv,
              :merchant_queue,
              :sales_engine

  def initialize(parent)
    @merchant_csv   = CSV.open './data/merchants.csv',
                    headers: true, header_converters: :symbol
    @merchant_queue = []
    @sales_engine   = parent
    @merchant_csv.map do |row|
      @merchant_queue << Merchant.new(row, self)
    end
  end

  def all
    #returns an array of all known Merchant instances
    @merchant_queue
  end

  def find_by_id(id)
    #returns either nil or an instance of Merchant with a matching ID
    parse_queue_by_id("id", id)
  end

  def find_by_name(name)
    #returns either nil or an instance of Merchant having done a case insensitive search
    parse_queue_by_name("name", name)
  end

  def find_all_by_name(name)
    #returns either [] or one or more matches which contain the supplied name fragment, case insensitive
    parse_queue_partial_words("name", name)
  end

  def parse_queue_by_id(column_name, criteria)
    results = []
    @merchant_queue.map do |row|
      next if row.id != criteria
      results << row
    end
    results
  end

  def parse_queue_by_name(column_name, criteria)
    results = []
    @merchant_queue.map do |row|
      next if row.name != criteria
      results << row
    end
    results
  end

  def parse_queue_partial_words(column_name, criteria)
    results = []
    @merchant_queue.map do |row|
      next if row.name.include?(criteria) == false
      results << row
    end
    results
  end

end
