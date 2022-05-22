require 'kimurai'
require 'uri'
require_relative 'rpi_locator_entry.rb'

class RpiLocatorSpider < Kimurai::Base
  @engine = :poltergeist_phantomjs

  def parse(response, url:, data: {})
    in_stock_rows = response.xpath("//*[contains(@class, 'table-success')]")

    rpi_locator_entries = in_stock_rows.map do |row|
      row_cells = row.children.select { |c| c.instance_of? Nokogiri::XML::Element }
      entry = RpiLocatorEntry.new(
        row_cells[0].text[0..-2], # remove last '\n' from text
        row_cells[1].text,
        row_cells[2].children[0].attributes["href"].value,
        row_cells[4].text,
        row_cells[7].text
      )
      entry
    end

    rpi_locator_entries
  end
end