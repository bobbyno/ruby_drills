require 'slop'
require 'pry'
require 'colorize'
require 'readline'

require 'ruby_drills/version'
require 'ruby_drills/cli'
require 'ruby_drills/commands'
require 'ruby_drills/drill'
require 'ruby_drills/drills'
require 'ruby_drills/chomper'
require 'ruby_drills/sessions/local'
require 'ruby_drills/config'

class Starter
  include Commands

  def initialize
    RubyDrills::Config.pry_config
    clear
    welcome
    menu(drills)
    clear
    quit
  end

  def menu(options)
    choice = nil
    valid_choices = (0...options.size).to_a.map {|x| x.to_s}

    while (choice != '-1')
      if valid_choices.include?(choice)
        clear
        run_drill(options[choice.to_i])
      end

      puts "\nChoose your adventure:\n\n"
      options.each_with_index {|opt, i| puts "\t #{i}: #{opt.capitalize}"}
      # TODO: Add profile option that shows aggregated totals from history.
      puts "\t-1: quit"

      choice = Readline.readline("\n>> ", true)
    end
  end

  def drills
    %w[welcome enumerable]
  end

private

  def run_drill(d)
    require "ruby_drills/#{d}/#{d}_drills"
    clazz = Module.const_get("#{d.capitalize}Drills")
    drill = clazz.new
    puts drill.banner
    continue
    drill.start
  end

end
