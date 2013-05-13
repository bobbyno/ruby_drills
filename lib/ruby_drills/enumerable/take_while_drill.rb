class TakeWhileDrill < Drill

  def initialize
    @a = [1, 2, 3, 4, 5, 0]
    super
  end

  def show
    puts %{
@a = #{@a.inspect}

Use the Enumerable method that passes elements to a block
until the block returns nil or false, then stops iterating and
returns an array of all prior elements to return #{expected.inspect}:
}
  end

  def hints
    ["http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-take_while"]
  end

  def reference
    "@a.take_while {|x| x < 4}"
  end

  def valid?(input)
    input.include?('take_while')
  end

end
