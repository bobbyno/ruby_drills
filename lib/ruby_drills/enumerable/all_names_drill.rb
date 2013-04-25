class AllNamesDrill < Drill

  def initialize
    @names = %w[ Al Slartibartfast Aaron Yvonne Bobby ]
  end

  def expected
    false
  end

  def show
    puts %{
@names = #{@names.inspect}

Use the method that passes each element of the collection
to the given block and returns true if the block never
returns false or nil to determine if the strings in @names
are over size 4:
}
  end

  def hint
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-all-3F"
  end

end
