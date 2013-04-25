class ChunkDrill < Drill
  def initialize
    @names = %w[ Al Slartibartfast Aaron Yvonne Bobby ]
  end

  def expected
    @names.sort.chunk {|n| n.ord}.reduce([]) {|acc, (char, lines)| acc << [char.chr, lines.size]}
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

  def hint
    puts "Remember, this method is especially useful for sorted series of elements."
    puts "Tony.ord => #{'Tony'.ord}"
    puts "84.chr => #{84.chr}"
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-chunk"
  end
end
