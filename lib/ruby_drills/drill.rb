class Drill
  attr_accessor :description

  def start
    context_binding = context
    prompt(context_binding)
  end

  def answer(ans=nil)
    grade(ans)
  end

  def show
    puts @description
  end

  def skip
    grade('skip')
  end

  def commands
    Pry::CommandSet.new do

      command "list", "see the available drills" do
        output.puts "TBD"
      end

      command "clear", "clear the screen" do
        system('clear');
      end

      command "quit", "end your session" do
        puts "Keep practicing!"
        exit
      end

      command "help", "show this message" do
        output.puts "\tanswer:\tsee if you're correct"
        output.puts "\tshow:\tshow the problem description"
        output.puts "\thint:\tget unstuck"
        output.puts "\tskip:\tmove on to the next drill"
        commands.each {|k,v| output.puts "\t#{k}:\t#{v.description}"}
      end

    end
  end

  def prompt(bind)
    Pry.start(bind, :quiet => true, :commands => commands)
  end

  def next_drill
      puts "Next isn't done yet..."
      # TODO: Call next_drill instead of exiting.
      exit
  end

private

  def grade(answer)
    # Data TODO: User's session can be retrieved with the following:
    # code = Pry::Code.from_file('(pry)')
    # lines = code.to_s.split('\n')

    case answer
    when nil
      puts "Did you forget to answer the question?"
    when expected
      puts "WIN!!!"
      next_drill
    when 'skip'
      puts "Better luck next time. Here's a hint for next time:"
      hint
      next_drill
    else
      puts "FAIL."
      hint
    end
  end
end
