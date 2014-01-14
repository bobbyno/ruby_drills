class ReduceDrill < Drill

  def setup
    @values = [ 1, 2, 3 ]
    @hints = ["Use a method from the Enumerable module", "How could you use reduce to solve this problem?"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Calculate the mean of this array.
}
  end

  def reference
    "@values.reduce(:+)/@values.size"
  end

  def valid?(input)
    input.include?("reduce")
  end

end
