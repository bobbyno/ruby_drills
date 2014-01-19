class SqueezeDrill < Drill

  def setup
    @values = %{Mississippi}
    @hints = ["how do you get toothpaste out of the tube.",
    "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-squeeze"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Remove all of the repeating characters from Mississippi,
leaving only one instance of each: 
}
  end



  def reference
    "@values.squeeze"
  end

  def valid?(input)
    input.include?("squeeze")
  end
end
