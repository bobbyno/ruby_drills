require 'set'
class UnionDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @another_set = Set.new([1, 2, 7, 9, 6])
    @hints = ["Alias for: |",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-merge"]
  end

  def show
    puts %{
@set = #{@set.inspect}
@another_set = #{@another_set.inspect}
Find the union between the two sets.
Bonus: open irb and switch the two sets, do you see any difference?
}
  end

  def reference
    "@set.union(@another_set)"
  end

  def valid?(input)
    input.include?("union") ||
    input.include?("|")
  end

end
