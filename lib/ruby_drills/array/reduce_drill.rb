class ReduceDrill < Drill

  def setup
    @values = [3, 5, 19, 25, 23, 40, 55, 36, 32, 52]
    @hints = ["How could you reduce this problem to something simpler?",
              "TODO: Inject a hint here...",
              "This method is called foldLeft in some languages.",
              "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-reduce"]
  end

  def show
    puts %{
@values = #{@values.inspect}

The mean of the numbers in @values is #{expected.inspect}.

Use a method that combines the items in an Enumerable by
iterating over them to calculate this mean.

}
  end

  def reference
    "@values.reduce(:+)/@values.size"
  end

  def valid?(input)
    ['reduce', 'inject'].any? {|x| input.include?(x) }
  end

end
