class Drill
  include Commands
  attr_accessor :next, :previous, :hints

  def initialize
    setup
    @context = Pry.binding_for(self)
  end

  def drills
    # Composite pattern: Allow for drill.start to work in the REPL or in tests.
    [self]
  end

  def expected
    eval(reference)
  end

  def non!(method, input)
    if (input.include?('!'))
      puts "\n\tAvoid using ! methods that modify their receiver...".red
      # We need to rerun setup since the user changed the state of
      # the drill.
      setup
      return false
    end

    input.include?(method)
  end

  def done?(input)
    case input.to_sym
    when :menu
      RubyDrills::Config::SESSIONS.command(self.class.name, input)
      clear
      true
    when :exit
      RubyDrills::Config::SESSIONS.command(self.class.name, input)
      quit
    when :show
      RubyDrills::Config::SESSIONS.command(self.class.name, input)
      show
    when lambda {|s| Commands.instance_methods.include?(s) }
      RubyDrills::Config::SESSIONS.command(self.class.name, input)
      self.send(input)
    else
      check_answer(input)
    end
  end

private

  def check_answer(input)
    begin
      Pry.run_command input, :context => @context, :output =>  answer = StringIO.new

      puts answer.string

      return fail(input) if eval(input, @context) != eval(reference, @context)
      return false if !comparable_answer?(input)
      win(input)
    rescue SyntaxError => ex
      puts "SyntaxError"
      fail(input)
    rescue StandardError => ex
      puts "#{ex.inspect}"
      fail(input)
    end
  end

  def comparable_answer?(input)
    valid?(input).tap do |pass|
      fail(input, "\tyou have the right answer, but try a different method.") if !pass
    end
  end

end
