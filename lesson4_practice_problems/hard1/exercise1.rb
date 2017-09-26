class SecretFile

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
  end
end

client2 = SecretFile.new('buy gold stocks', SecurityLogger.new)
puts client2.data


