require 'set'
class EachDrill < Drill

  def setup
    @set = Set.new([1, 2, 3, 4, 5, 6])
    @hints = ["http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-each"]
  end

  def show
    puts %{
@set = #{@set.inspect}
For each element in the set, use "puts" to print twice that element into the console.
}
  end

  def reference
    "@set.each{ |s| puts s*2 }"
  end

  def valid?(input)
    input.include?("each{")
  end

end
