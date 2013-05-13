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

    if Commands.instance_methods.include?(input.to_sym)
      self.send(input)
    else
      check_answer(input)
    end
  end

private

  def check_answer(input)
    begin
      Pry.run_command input, :context => @context, :output =>  answer = StringIO.new
      Pry.run_command reference, :context => @context, :output => exp = StringIO.new

      puts answer.string

      return fail if answer.string != exp.string
      return false if !comparable_answer?(input)
      win(input)
    rescue SyntaxError => ex
      puts "SyntaxError"
      fail
    rescue StandardError => ex
      puts "#{ex.inspect}"
      fail
    end
  end

  def comparable_answer?(input)
    contains_required(input).tap {|pass| fail("\tyou have the right answer, but try a different method.") if !pass}
  end

end
