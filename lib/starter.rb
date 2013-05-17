require 'slop'
require 'pry'
require 'colorize'
require 'readline'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/commands'
require 'ruby_drills/drill'
require 'ruby_drills/chomper'
require 'ruby_drills/sessions/local'
require 'ruby_drills/config'

class Starter
  include Commands

  def initialize
    RubyDrills::Config.pry_config
    clear

    # Assumes that the user wants to proceed linearly through the drills.
    # TODO: Provide a menu and let the user pick the next thing they want to do.
    drills.each {|d| run_drill(d) }

    clear
    quit
  end

  def drills
    %w[welcome enumerable]
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

end
