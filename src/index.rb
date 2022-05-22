require 'rufus-scheduler'
require 'dotenv'
require_relative 'rpi_locator_spider.rb'
require_relative 'send_tg_notification_stock.rb'
require_relative 'kimurai_config.rb'
require_relative 'logger.rb'

Dotenv.load
scheduler = Rufus::Scheduler.new
rejected_regions = ["(US)", "(JP)", "(CA)", "(CN)", "(ZA)"]

log_app "App running! Running cron job each #{ENV['SCHEDULER_TIME_FREQUENCY']}."

scheduler.in ENV['SCHEDULER_TIME_FREQUENCY'] do
  log_cron "Starting task..."
  rpi_locator_entries = RpiLocatorSpider.parse!(:parse, url: "https://rpilocator.com")
  rpi4_8gb_entries_eur = rpi_locator_entries.select { |e| e.sku == ENV['RPI_SKU'] && rejected_regions.none? { |zone| e.vendor.include? zone } }
  if rpi4_8gb_entries_eur.empty?
    log_app "No #{ENV['RPI_SKU']} in stock in Europe."
  else
    log_app "Stock found!"
    send_tg_notification_stock rpi4_8gb_entries_eur
  end
end

scheduler.join