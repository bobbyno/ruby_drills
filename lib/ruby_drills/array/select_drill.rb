class SelectDrill < Drill

  def setup
    @values = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    @hints = ["Are you being selective enough?",
              "This method is called filter in other languages.",
              "http://ruby-doc.org//core-2.2.0/Enumerable.html#method-i-select"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Return a new array containing only elements evenly
divisible by 3.

Use the method that returns an array containing all
elements for which the given block returns a true value.
    }

  end

  def reference
    "@values.select {|x| x % 3 == 0}"
  end

  def valid?(input)
    ['select', 'find_all'].any? { |x| input.include?(x) }
  end

end
