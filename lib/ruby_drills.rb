require 'slop'
require 'pry'
require 'colorize'
require 'readline'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/commands'
require 'ruby_drills/drill'

class RubyDrills
  include Commands

  def self.start
    RubyDrills.new
  end

  def drills
    %w[welcome enumerable]
  end

  def initialize
    config_pry
    clear

    # Assumes that the user wants to proceed linearly through the drills.
    # TODO: Provide a menu and let the user pick the next thing they want to do.
    drills.each {|d| run_drill(d) }

    clear
    quit
  end

private

  def run_drill(d)
    Dir["./lib/ruby_drills/#{d}/*drill.rb"].each do |f|
      require f
    end
    require "ruby_drills/#{d}/#{d}_drills"
    clazz = Module.const_get("#{d.capitalize}Drills")
    drill = clazz.new
    puts drill.banner
    continue
    drill.start
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
