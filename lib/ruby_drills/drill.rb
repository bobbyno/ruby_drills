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
        output.puts "\tanswer [code]:\tcall with the code that answers the question to see if you're correct"
        output.puts "\tshow:\tshow the problem description"
        output.puts "\thint:\tget unstuck"
        output.puts "\tfold:\tknow when to fold 'em...and move on to the next drill"
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
      hint
      puts
  end

  def grade(answer)
    # Data TODO: User's session can be retrieved with the following:
    # code = Pry::Code.from_file('(pry)')
    # lines = code.to_s.split('\n')

    case answer
    when nil
      puts "Did you forget to answer the question?"
    when expected
      puts "\n\tWIN!!!\n".green
      next_drill
    when 'fold'
      puts "Know when to fold 'em..."
      puts hint
      puts
      next_drill
    else
      fail
    end
  end
end
