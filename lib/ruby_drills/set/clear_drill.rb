require 'set'
class ClearDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["This method is mutable and therefore not recommended!",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-clear"]
  end

  def show
    puts %{
@set = #{@set.inspect}
Use a method that removes all the elements from the set (this method is mutable and therefore not recomanded, yet exists!).
}
  end

  def reference
    "@set.clear"
  end

  def valid?(input)
    input.include?("clear")
  end

end
