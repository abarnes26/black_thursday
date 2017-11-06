require_relative 'merchant'
require_relative 'sales_engine'
require 'csv'

class MerchantRepository
  attr_reader :merchants,
              :parent

  def initialize(parent, filename)
    @merchants           = []
    @sales_engine        = parent
    @load                = load_file(filename)
  end

  def load_file(filename)
    merchant_csv = CSV.open filename,
                             headers: true,
                             header_converters: :symbol
    merchant_csv.each do |row| @merchants << Merchant.new(row, self)
    end
  end

  def all
    merchants
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name.downcase == name.downcase }
  end

  def find_all_by_name(name)
    merchants.find_all do |merchant|
      merchant.name.downcase.include?(name.downcase)
    end
  end

  def find_items(item_id)
    @sales_engine.find_items(item_id)
  end

  def find_invoices(id)
    @sales_engine.find_invoices(id)
  end

  def inspect
      "#<#{self.class} #{@merchants.size} rows>"
  end
end
