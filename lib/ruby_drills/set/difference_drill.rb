require 'set'
class DifferenceDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @another_set = Set.new([1, 2, 7, 9, 6])
    @hints = ["Alias for '-''",
      "http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-difference"]
  end

  def show
    puts %{
@set = #{@set.inspect}
@another_set = #{@another_set.inspect}

Find the difference between @set and @another_set
Bonus: Open irb, and initialize @set and @another_set, find the difference
between @set and @anotherset and compare it with the difference between
@another_set and @set!
}
  end

  def reference
    "@set.difference(@another_set)"
  end

  def valid?(input)
    input.include?("difference") ||
    input.include?("-")
  end

end
