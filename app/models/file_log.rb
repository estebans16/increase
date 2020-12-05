# Custom log for FileService
class FileLog
  LogFile = Rails.root.join('log', 'file.log')
  class << self
    cattr_accessor :logger
    delegate :debug, :info, :warn, :error, :fatal, to: :logger
  end
end