require 'slop'
require 'pry'

require 'ruby_drills/version'
require 'ruby_drills/cli'

class RubyDrills

  def self.start
    d = RubyDrills.new
    puts "Here we go..."
  end

  def initialize
    config_pry
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
