
require 'set'
class IncludeDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-include-3F"]
  end

  def show
    puts %{
@set = #{@set.inspect}
Use a method to find out if the set include 0?
}
  end

  def reference
    "@set.include?(0)"
  end

  def valid?(input)
    input.include?("include?")
  end

end
