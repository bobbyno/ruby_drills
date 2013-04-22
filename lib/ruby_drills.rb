require 'slop'
require 'pry'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/drill'

require 'ruby_drills/enumerable/enumerable_drills'

class RubyDrills

  def self.start
    RubyDrills.new
  end

  def initialize
    config_pry
    enum_drills = EnumerableDrills.new
    puts enum_drills.banner
    enum_drills.start
  end

  def config_pry
    Pry.config.pager = false

    Pry.config.prompt = [
      proc { |target_self, nest_level, pry|
        "[#{pry.input_array.size}] #{":#{nest_level}" unless nest_level.zero?}>> "
        },
        proc { |target_self, nest_level, pry|
          "[#{pry.input_array.size}] #{":#{nest_level}" unless nest_level.zero?}* "
        }
      ]
  end
end
