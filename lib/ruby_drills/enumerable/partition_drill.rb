class PartitionDrill < Drill
  def setup
    @numbers = (0...10).to_a
  end

  def show
    puts %{
@numbers = #{@numbers.inspect}

Split this array into even and odd numbers to obtain
#{expected}.

Use the method that returns two arrays, the first containing
the elements of enum for which the block evaluates to true,
the second containing the rest.
}
  end

  def hints
    ["What's another word for 'split' or 'divide'?", "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-partition"]
  end

  def reference
    "@numbers.partition {|x| x.even? }"
  end

  def valid?(input)
    true
  end
end
