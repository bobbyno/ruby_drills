class ZipDrill < Drill

  def setup
    @a = [ 4, 5, 6 ]
    @b = [ 7, 8, 9 ]
    @hints = ["http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-zip"]
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

  def valid?(input)
    input.include?('zip')
  end

end
