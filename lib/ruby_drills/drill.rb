class Drill

  def expected
    eval(reference)
  end

  def done?(input)
    case input
    when 'help'
      Commands.help
      false
    when 'pry'
      @context.pry
      false
    when '?'
      Commands.help
      false
    when 'clear'
      system('clear')
      false
    when 'show'
      show
      false
    when 'hint'
      puts hints[rand(0...hints.size)]
    when 'skip'
      puts "\n\tskipping...for now...".yellow
      true
    when 'fold'
      puts "\nYou got to know when to hold 'em, know when to fold 'em...\n".yellow
      true
    when 'quit'
      Commands.exit
      exit
    when 'exit'
      Commands.exit
      exit
    else
      check_answer(input)
    end
  end

private

  def check_answer(input)
    @context ||= Pry.binding_for(self)
    answer = StringIO.new
    exp = StringIO.new

    begin
      Pry.run_command input, :context => @context, :output => answer
      Pry.run_command reference, :context => @context, :output => exp
      puts "=> #{@context.eval(input)}"
    rescue
      puts "Error:"
      puts answer.string
      Commands.fail
      return false
    end

    case answer.string
    when nil
      puts "Did you forget to answer the question?"
      false
    when exp.string
      # TODO: check required elements  (RESUME HERE)
      # Add a validation function that takes the input and looks for the key
      # methods that must be part of a winning solution.
      puts "\n\t!!! WIN !!!\n".green
      puts "How did your approach compare to this?"
      puts reference
      true
    else
      Commands.fail
      false
    end
  end
end
