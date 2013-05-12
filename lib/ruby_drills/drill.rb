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
      valid = required.all? {|req| input.include?(req) }
      fail("\tyou have the right answer, but try a different method.") if !valid
      valid
  end

  def check_answer(input)
    begin
      Pry.run_command input, :context => @context, :output =>  answer = StringIO.new
      Pry.run_command reference, :context => @context, :output => exp = StringIO.new
      puts "=> #{@context.eval(input)}"

      return fail if answer.string != exp.string
      comparable = input_compares_to_required?(input)
      return false if !comparable
      win(input)
    rescue StandardError => ex
      puts "#{input} caused an error: #{ex.inspect}"
      fail
    end
  end
end
