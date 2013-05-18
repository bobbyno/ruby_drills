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
    drill_choices = (0...options.size).to_a.map {|x| x.to_s}

    while (choice != 'q')
      if drill_choices.include?(choice)
        clear
        run_drill(options[choice.to_i])
      elsif (choice == 's')
        RubyDrills::Config::SESSIONS.stats
      end

      puts "\nChoose your next adventure:\n\n"
      options.each_with_index {|opt, i| puts "\t#{i}: #{opt.capitalize}"}
      puts "\n\ts: see your stats"
      puts "\tq: quit"

      choice = Readline.readline("\n>> ", true)
    end
  end

  def drills
    %w[welcome string enumerable array hash]
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
