class ZipDrill < Drill

  def initialize
    @a = [ 4, 5, 6 ]
    @b = [ 7, 8, 9 ]
  end

  def show
    puts %{We have two arrays:
@a: #{@a.inspect}
@b: #{@b.inspect}

Use the Enumerable method that will take one element from a new
array and merge the corresponding elements from a and b to return
#{expected.inspect}:
    }
  end

  def reference
    "[1,2,3].zip(@a, @b)"
  end

  def hints
    ["http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-zip"]
  end

end
