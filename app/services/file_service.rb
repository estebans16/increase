# Get and parse file
class FileService
  def call
    begin
      response_file = External::IncreaseApi.file
      return logger if response_file.status != 200

      parse_file = ParseFile.new(response_file.file)
      save_payments(parse_file.process)
    ensure
      response_file.file.close
      File.delete(response_file.file.path)
    end
  end

  private

  def save_payments(payments)
    payments.each do |payment|
      next unless payment.client.valid?

      payment.save
    end
  end

  def logger
    FileLog.warn('Error on get file')
  end
end
