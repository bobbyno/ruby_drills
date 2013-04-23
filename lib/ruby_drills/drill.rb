class Drill
  attr_accessor :expected, :hint

  def initialize

  end

  def run
    context_binding = context
    prompt(context_binding)
    # grade
  end

  def prompt(b)
    Pry.start(b, :quiet => true)
  end

  def skip
    grade('skip')
  end

  def clear
    system('clear')
  end

  def quit
    grade('quit')
  end

  # How about just having a check method that let's you pass in an expression and see if it matches?
  def answer(ans)
    grade(ans)
  end

private

  def grade(answer)
    # User's session can be retrieved with the following:
    # code = Pry::Code.from_file('(pry)')
    # lines = code.to_s.split('\n')

    case answer
    when nil
      clear
      puts "Did you forget to answer the question?"
    when @expected
      puts "Nice one!"
      # Resume here: Exit quits the whole program, not just the pry repl. How to do that?
      exit
    when 'skip'
      puts "Better luck next time."
      exit
    when 'quit'
      puts "Bye for now."
      exit
    else
      clear
      puts "Good try: The answer is #{@expected}, but you answered #{answer}."
    end
  end
end
