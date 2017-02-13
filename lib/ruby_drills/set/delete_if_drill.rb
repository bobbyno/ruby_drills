require 'set'
class DeleteIfDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["This method is mutable and it will return self if the delete is successful, otherwise nil if the object doesn't exist. For that reason you can use it in the 'if' condition!",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-delete-3F"]
  end

  def show
    puts %{
@set = #{@set.inspect}

Use a method to delete 7 form the set, if it exists. This method will return nil if the object doesn't exist in the set, therefore, you can use it in the 'if' condition.
Bonus: open irb, require 'set' and initialize @set just like the example above. Then try
to delete 6, and 7 if they exist (doesn't exist in the set) to see what happens!
}
  end

  def reference
    "@set.delete?(6)"
  end

  def valid?(input)
    input.include?("delete?")
  end

end
