require 'slop'
require 'pry'
require 'colorize'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/drill'

require 'ruby_drills/enumerable/enumerable_drills'

class RubyDrills

  def self.start
    RubyDrills.new
  end

  def banner
    %{
Welcome to Ruby Drills!

Drills are a way to engage in deliberate practice to master a language.
Challenges in Ruby Drills are focused on a specific method. Answers typically
consist of a single line. Your objective is to complete the drill with ease and joy,
without consulting any external documentation.

------------------------------------------------------------------
    }
  end

  def epilogue
    "\nThe master and the master's path are one...keep walking the Long Road."
  end

  def initialize
    config_pry
    enum_drills = EnumerableDrills.new
    system 'clear';
    puts banner
    press_any
    puts enum_drills.banner
    press_any
    enum_drills.start
    system('clear');
    puts epilogue
    puts
  end

  def press_any
    puts "\nPress any key to continue:"
    gets.chomp
    system('clear');
  end

  def config_pry
    Pry.config.pager = false

    Pry.config.prompt = [
      proc { |target_self, nest_level, pry|
        "#{":#{nest_level}" unless nest_level.zero?}>> "
        },
        proc { |target_self, nest_level, pry|
          "#{":#{nest_level}" unless nest_level.zero?}* "
        }
      ]
  end
end
