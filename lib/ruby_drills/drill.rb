class Drill
  attr_accessor :description, :out

  def add(drill=nil)
    @out = drill
  end

  def start
    show
    puts
    self.pry(:quiet => true, :commands => commands)
  end

  def answer(ans=nil)
    grade(ans)
  end

  def expected
    eval(reference)
  end

  def skip
    grade('skip')
  end

  def fold
    puts "\nKnow when to fold 'em...\n".yellow
    grade('skip')
  end

  def commands
    Pry::CommandSet.new do

      command "clear", "clear the screen" do
        system('clear');
      end

      command "quit", "end your session" do
        puts "Keep practicing!"
        exit
      end

      command "help", "show this message" do
        output.puts "\tanswer _:\twhen you think you have the right answer, call answer _ to check."
        output.puts "\tshow:\tshow the problem description"
        output.puts "\thint:\tget unstuck"
        output.puts "\tskip:\tmove on to the next drill"
        commands.each {|k,v| output.puts "\t#{k}:\t#{v.description}"}
      end

    end
  end

  def next_drill
      exit if @out.nil?
      out.start
  end

private

  def fail(message=nil)
      puts "\tFAIL.".red
      puts message.red unless message.nil?
      puts
  end

  def press_any
      puts "\nPress any key to continue:"
      gets.chomp
      system('clear');
  end

  def grade(answer)
    # Data TODO: User's session can be retrieved with the following:
    # code = Pry::Code.from_file('(pry)')
    # lines = code.to_s.split('\n')

    # line buffer will work if the user types answer _ to check their work.
    # Pry.line_buffer[Pry.current_line-1]

    case answer
    when nil
      puts "Did you forget to answer the question?"
    when expected
      puts "\n\tWIN!!!\n".green
      puts "How did your approach compare to this?"
      puts reference
      press_any
      next_drill
    when 'skip'
      press_any
      next_drill
    else
      fail
    end
  end
end
