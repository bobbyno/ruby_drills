class ChunkDrill < Drill

  def setup
    @names = %w[ Al Slartibartfast Aaron Yvonne Bobby ]
    @hints = ["Remember, this method is especially useful for sorted series of elements.",
              ".to_a can be useful to see the output of methods that produce Enumerators",
              "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-chunk"]
  end

  def show
    puts %{
@names = #{@names.inspect}

Count the words in @names by the first letter of each name
to produce an array containing:
#{expected}

First sort this array, then use the method that splits self into
multiple Enumerators using the rule given in the block. It
then passes the result of the rule and an Enumerator
of the successive elements to another Enumerable method.

}
  end

  def reference
    "@names.sort.chunk {|n| n[0]}.map {|char, lines| [char, lines.size]}"
  end

  def valid?(input)
    ["chunk", "sort"].all? {|fn| input.include?(fn)}
  end

end
