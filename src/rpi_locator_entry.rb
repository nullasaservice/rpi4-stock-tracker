class RpiLocatorEntry
  attr_reader :sku, :description, :link, :vendor, :price

  def initialize(sku, description, link, vendor, price)
    @sku = sku
    @description = description
    @link = link
    @vendor = vendor
    @price = price
  end

  def to_s
    "[#{@description} @ #{@vendor} for #{@price}](#{@link})"
  end
end