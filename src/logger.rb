def log_system(caller, msg)
  puts "[#{caller} @ #{Time.now}] #{msg}"
end

def log_app(msg)
  log_system "APP", msg
end

def log_cron(msg)
  log_system "CRON", msg
end

def log_tg_bot(msg)
  log_system "TG BOT", msg
end