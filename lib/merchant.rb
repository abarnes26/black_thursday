class Merchant
  attr_reader :id,
              :name,
              :repository

  def initialize(row, parent)
    @id   = row[:id].to_i
    @name = row[:name]
    @repository = parent
  end

  def items
    repository.find_items(self.id)
  end

  def invoices
    repository.find_invoices(self.id)
  end

end
