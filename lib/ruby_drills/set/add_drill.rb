require 'set'
class AddDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["equivalent to <<",
      "equivalent to 'mereg'",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-add"]
  end

  def show
    puts %{
@set = #{@set.inspect}

Add number 7 to the set.
Bonus: open irb, require 'set' and initialize @set just like the example above. Then try
to add 0, 1, 7, and 8 to see what happens!
}
  end

  def reference
    "@set.add(7)"
  end

  def valid?(input)
    input.include?("add") ||
    input.include?("<<") ||
    input.include?("merge")
  end

end
