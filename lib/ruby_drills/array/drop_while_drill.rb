class DropWhileDrill < Drill

  def setup
    @b = [1, 2, 3, 4, 5, 0]
    @hints = ["http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-drop_while"]
  end

  def show
    puts %{
@b = #{@b.inspect}

Use the Enumerable method that removes elements up to, but not including,
the first element for which the block returns nil or false and returns an array
containing the remaining elements, resulting in:
#{expected}
}
  end

  def reference
    "@b.drop_while {|x| x < 4}"
  end

  def valid?(input)
    input.include?('drop_while')
  end

end
