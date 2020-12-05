Rails.configuration.to_prepare do
  FileLog.logger = Logger.new(FileLog::LogFile)
  FileLog.logger.level = 'debug' # could be debug, info, warn, error or fatal
end