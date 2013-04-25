class ChunkDrill < Drill
  def initialize
    @names = %w[ Al Slartibartfast Aaron Yvonne Bobby ]
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
    "@names.sort.chunk {|n| n[0]}.reduce([]) {|acc, (char, lines)| acc << [char, lines.size]}"
  end

  def hint
    puts "Remember, this method is especially useful for sorted series of elements."
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-chunk"
  end
end
