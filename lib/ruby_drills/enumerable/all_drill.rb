class AllDrill < Drill

  def setup
    @values = [ nil, true, 99 ]
    @hints = ["http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-all-3F"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Does this array contain values that are false or nil?

Use the method that will return true only if none of the collection
members are false or nil. No block is necessary to answer this:
}
  end

  def reference
    "@values.all?"
  end

  def valid?(input)
    input.include?("all?")
  end

end
