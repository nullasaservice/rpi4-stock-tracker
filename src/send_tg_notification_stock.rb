require 'telegram/bot'
require_relative 'logger.rb'

def send_tg_notification_stock(rpi_locator_entries)
  token = ENV['TG_BOT_TOKEN']
  Telegram::Bot::Client.run(token) do |bot|
    log_tg_bot "Sending message..."
    message_text = "
      Stock found for #{ENV['RPI_SKU']}:
#{rpi_locator_entries.reduce("") { |str, entry| str + "- " + entry.to_s + "\n" } }
    "
    bot.api.send_message(chat_id: ENV['TG_CHAT_ID'].to_i, text: message_text, parse_mode: "markdown", disable_web_page_preview: true)
    log_tg_bot "Message sent!"
  end
end