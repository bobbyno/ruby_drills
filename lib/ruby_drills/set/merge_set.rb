require 'set'
class MergeDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @another_set = Set.new([1, 2, 7, 9, 6])
    @hints = ["http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-merge"]
  end

  def show
    puts %{
@set = #{@set.inspect}
@another_set = #{@another_set.inspect}

User a method to add all elements of @another_set to @set
What happens to the duplicates?
}
  end

  def reference
    "@set.merge(@another_set)"
  end

  def valid?(input)
    input.include?("merge")
  end

end
