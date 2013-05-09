class Drill
  attr_accessor :description

  def expected
    eval(reference)
  end

  def commands
    Pry::CommandSet.new do
      command "help", "show this message" do
        output.puts "\tshow:\tshow the problem description"
        output.puts "\thint:\tget unstuck"
        output.puts "\tskip:\tmove on to the next drill"
        commands.each {|k,v| output.puts "\t#{k}:\t#{v.description}"}
      end

    end
  end

  def fail(message=nil)
      puts "\n\tnot yet...".yellow
      puts message.yellow unless message.nil?
  end

  def grade(input)
    case input
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
    when 'exit'
      system('clear')
      puts %{
        Mastery...the mysterious process during which what is at first difficult
        becomes progressively easier and more pleasurable through practice.

                                                              --- George Leonard}
      puts
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
    end

    case answer.string
    when nil
      puts "Did you forget to answer the question?"
      false
    when exp.string
      puts "\n\t!!! WIN !!!\n".green
      puts "How did your approach compare to this?"
      puts reference
      # TODO: Add required elements to the solution.
      true
    else
      fail
      false
    end
  end
end
