class AllDrill < Drill

  def initialize
    @values = [ nil, true, 99 ]
  end

  def expected
    false
  end

  def show
    puts %{
@values = #{@values.inspect}

Use the method that will return true only if none of the collection
members are false or nil. Omit the block:
}
  end

  def hint
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-all-3F"
  end

end
