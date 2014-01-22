class MapDrill < Drill

  def setup
    @numbers = (0..10).to_a
    @hints = ["You want to divide each member of this collection by two...",
              "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-map"]
  end

  def show
    puts %{
@numbers = #{@numbers.inspect}

Use the method that returns a new array with the results of
running block once for every element in enum to produce
#{expected}

}
  end

  def reference
    "@numbers.map {|x| x / 2}"
  end

  def valid?(input)
    ['map', 'collect'].any? {|x| input.include? x}
  end

end
