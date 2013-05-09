class Commands
  def self.press_any
      puts "\nPress any key to continue:"
      gets.chomp
      system('clear');
  end
end
