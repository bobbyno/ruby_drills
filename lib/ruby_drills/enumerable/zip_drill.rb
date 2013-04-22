class ZipDrill < Drill

  def initialize
    @expected = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

  def run
    a = [ 4, 5, 6 ]
    b = [ 7, 8, 9 ]

    puts %{
We have two arrays:
a: #{a.inspect}
b: #{b.inspect}

Which Enumerable method will take one element from a new array and
merge the corresponding elements from a and b to yield
#{@expected.inspect}?
    }

    prompt binding
    grade
  end

  def hint
    puts "Check the Ruby documentation:"
    puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-zip"
  end

end
