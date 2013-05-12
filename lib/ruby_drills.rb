require 'slop'
require 'pry'
require 'colorize'
require 'readline'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/commands'
require 'ruby_drills/drill'

Dir['./lib/ruby_drills/enumerable/*drill.rb'].each do |f|
  require f
end
require 'ruby_drills/enumerable/enumerable_drills'

class RubyDrills
  include Commands

  def self.start
    RubyDrills.new
  end

  def initialize
    config_pry

    # Welcome drill
    clear
    welcome
    continue
    help
    continue

    # Drills
    enum_drills = EnumerableDrills.new
    puts enum_drills.banner
    continue
    enum_drills.start

    clear
    quit
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
