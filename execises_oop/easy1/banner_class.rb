class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horitontal_rule, empty_line, message_line, empty_line, horitontal_rule].join("\n")
  end

  private

  def message_size
    @message.size
  end

  def horitontal_rule
    "+-" + '-' * message_size + "-+"
  end

  def empty_line
    "| " + ' ' * message_size + " |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
