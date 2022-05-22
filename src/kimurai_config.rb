Kimurai.configure do |config|
  # Default logger has colored mode in development.
  # If you would like to disable it, set `colorize_logger` to false.
  # config.colorize_logger = false

  # Logger level for default logger:
  config.log_level = :error

  # Custom logger:
  # config.logger = Logger.new(STDOUT)

  # Custom time zone (for logs):
  # config.time_zone = "UTC"
  # config.time_zone = "Europe/Moscow"

  # Provide custom chrome binary path (default is any available chrome/chromium in the PATH):
  # config.selenium_chrome_path = "/usr/bin/chromium-browser"
  # Provide custom selenium chromedriver path (default is "/usr/local/bin/chromedriver"):
  # config.chromedriver_path = "~/.local/bin/chromedriver"
end