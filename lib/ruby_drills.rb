require 'slop'
require 'pry'
require 'colorize'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/drill'
require 'ruby_drills/commands'

require 'ruby_drills/enumerable/enumerable_drills'

class RubyDrills

  def self.start
    RubyDrills.new
  end

  def initialize
    config_pry
    system 'clear';
    Commands.welcome
    Commands.continue
    Commands.help
    Commands.continue

    enum_drills = EnumerableDrills.new
    puts enum_drills.banner
    Commands.continue
    enum_drills.start

    system('clear');
    Commands.exit
    puts
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
