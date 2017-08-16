class Mark
  private
  def speak 
    puts 'hallo'
  end
end

class Jan < Mark

end

Jan.new.speak
