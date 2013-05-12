class Drill
  include Commands

  def initialize
    @context = Pry.binding_for(self)
  end

  def expected
    eval(reference)
  end

  def done?(input)
    quit if input == 'exit'
    self.send(input)
  end

  def method_missing(symbol, *args, &block)
    check_answer(symbol.to_s)
  end

private

  def input_compares_to_required?(input)
      if (!(valid = required.all? {|req| input.include?(req) }))
        fail("\tyou have the right answer, but try a different method.")
      end
      return valid
  end

  def check_answer(input)
    answer = StringIO.new
    exp = StringIO.new

    begin
      Pry.run_command input, :context => @context, :output => answer
      Pry.run_command reference, :context => @context, :output => exp
      puts "=> #{@context.eval(input)}"
    rescue StandardError => ex
      puts "Error: #{ex.inspect}"
      puts answer.string
      fail
    end

    case answer.string
    when nil
      puts "Did you forget to answer the question?"
      false
    when exp.string
      return false if !input_compares_to_required?(input)

      puts "\n\t!!! WIN !!!\n".green
      puts "How does your answer compare to the reference?"
      puts reference
      true
    else
      fail
    end
  end
end
