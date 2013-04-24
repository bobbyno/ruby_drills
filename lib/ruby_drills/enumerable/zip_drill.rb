class ZipDrill < Drill

  def initialize
    @a = [ 4, 5, 6 ]
    @b = [ 7, 8, 9 ]
  end

  def expected
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  def show
    puts %{We have two arrays:
@a: #{@a.inspect}
@b: #{@b.inspect}

Use an Enumerable method to take one element from a new array and
merge the corresponding elements from a and b to yield
#{expected.inspect}:
    }
  end

  def hint
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-zip"
  end

end
