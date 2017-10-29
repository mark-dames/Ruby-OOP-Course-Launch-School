class Banner
  def initialize(message, width = message.size)
    @message = message
    @width = width
    @width = message.size + 2 if @width < message.size
  end

  def to_s
    [horitontal_rule, empty_line, message_line, empty_line, horitontal_rule].join("\n")
  end

  private
  
  def horitontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('Mark Dames.')
puts banner
