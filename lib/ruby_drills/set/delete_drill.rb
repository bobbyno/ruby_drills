require 'set'
class DeleteDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["This method is mutable and it will return self",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-delete"]
  end

  def show
    puts %{
@set = #{@set.inspect}

Use a method to delete 6 form the set.
Bonus: open irb, require 'set' and initialize @set just like the example above. Then try
to delete 6, and 7 (doesn't exist in the set) to see what happens!
}
  end

  def reference
    "@set.delete(6)"
  end

  def valid?(input)
    input.include?("delete")
  end

end
