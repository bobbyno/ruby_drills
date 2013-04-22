class Drill
  attr_accessor :expected, :answer, :hint

  def initialize
    @answer = nil
  end

  def prompt(b)
    puts "Store your answer in a variable called '@answer', then exit the REPL to see the results:"
    Pry.start(b, :quiet => true)
  end

  def grade
    # User's session can be retrieved with the following:
    # code = Pry::Code.from_file('(pry)')
    # puts code.to_s

    case @answer
    when nil
      puts "Did you forget to store your expression in '@answer'?"
    when @expected
      puts "Nice one!"
    when 'quit'
      puts "Bye for now."
      exit
    else
      puts "Good try: The answer is #{@expected}, but you answered #{@answer}."
    end
  end
end
