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
    return show if input == 'show'
    # check list of methods in Commands and send if found
    if Commands.instance_methods.include?(input.to_sym)
      self.send(input)
    else
      check_answer(input)
    end
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
    rescue SyntaxError => ex
      puts "SyntaxError"
      fail
    rescue StandardError => ex
      puts "#{ex.inspect}"
      fail
    end
  end
end
