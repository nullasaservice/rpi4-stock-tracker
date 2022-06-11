require 'rufus-scheduler'
require 'dotenv'
require_relative 'rpi_locator_spider.rb'
require_relative 'send_tg_notification_stock.rb'
require_relative 'kimurai_config.rb'
require_relative 'logger.rb'

Dotenv.load
scheduler = Rufus::Scheduler.new

# initialize rejected_regions array
rejected_regions = ENV['REJECTED_REGIONS']
rejected_regions = rejected_regions.split ","
rejected_regions.map! { |r| "(" + r + ")" }

# initialize rpi_sku_array
rpi_sku_array = ENV['RPI_SKU_ARRAY']
rpi_sku_array = rpi_sku_array.split ","

log_app "App running! Running cron job each #{ENV['SCHEDULER_TIME_FREQUENCY']}."

scheduler.every ENV['SCHEDULER_TIME_FREQUENCY'] do
  log_cron "Starting task..."
  rpi_locator_entries = RpiLocatorSpider.parse!(:parse, url: "https://rpilocator.com")
  wanted_rpi_stock_entries = rpi_locator_entries.select { |e| rpi_sku_array.any? { |sku| sku == e.sku } && rejected_regions.none? { |zone| e.vendor.include? zone } }
  if wanted_rpi_stock_entries.empty?
    log_app "No #{ENV['RPI_SKU']} in stock with given restrictions."
  else
    log_app "Stock found!"
    send_tg_notification_stock wanted_rpi_stock_entries
  end
end

scheduler.join