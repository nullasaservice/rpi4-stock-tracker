# Raspberry Pi stock tracker
This page uses the amazing work @ https://rpilocator.com to notify via Telegram if there is any available stock.

## Install
1. Install and run `bundle` gem, to get required dependencies.
2. Check [kimurai installation docs](https://github.com/vifreefly/kimuraframework#installation), as you will need to install manually selenium-chromedriver. Make sure to not use the link provided there to download chromedriver, as it is so old it will fail to run the script with it. Check your Chrome/Chromium version and download proper version [here](https://chromedriver.chromium.org/downloads).
3. Fill .env file with the required environment variables (example @ `.env.example`).

## Usage
Run `ruby src/index.rb`.

## Dependencies
- [dotenv](https://github.com/bkeepers/dotenv), for getting environment variables.
- [kimurai](https://github.com/vifreefly/kimuraframework), for web scraping.
- [rufus-scheduler](https://github.com/jmettraux/rufus-scheduler), for cron jobs.
- [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby), for sending Telegram messages.