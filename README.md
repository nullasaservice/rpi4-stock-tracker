# Raspberry Pi stock tracker
This page uses the amazing work @ https://rpilocator.com to notify via Telegram if there is any available stock.

## Install
1. Install and run `bundle` gem, to get required dependencies.
2. Check [kimurai installation docs](https://github.com/vifreefly/kimuraframework#installation), as you will need to install manually PhantomJS.
3. Fill .env file with the required environment variables (example @ `.env.example`).

## Usage
Run `ruby src/index.rb`.

## Dependencies
- [dotenv](https://github.com/bkeepers/dotenv), for getting environment variables.
- [kimurai](https://github.com/vifreefly/kimuraframework), for web scraping.
- [rufus-scheduler](https://github.com/jmettraux/rufus-scheduler), for cron jobs.
- [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby), for sending Telegram messages.