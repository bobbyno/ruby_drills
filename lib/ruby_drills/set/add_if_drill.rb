require 'set'
class AddIfDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["very similar to add, except that if the object exists, it will return nil, therefore you can use if in 'if' condition",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-add-3F"]
  end

  def show
    puts %{
@set = #{@set.inspect}

Add number 6 to the set, if it doesn't exist already.
Bonus: open irb, require 'set' and initialize @set just like the example above. Then try
to add 0, 2, 7, and 8 to see what happens!
}
  end

  def reference
    "@set.add?(6)"
  end

  def valid?(input)
    input.include?("add?")
  end

end
