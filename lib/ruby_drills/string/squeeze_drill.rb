class SqueezeDrill < Drill

  def setup
    @value = %{Mississippi}
    @hints = ["how do you get toothpaste out of the tube.",
    "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-squeeze"]
  end

  def show
    puts %{
@value = #{@value.inspect}

Remove all of the repeating characters from Mississippi,
leaving only one instance of each.
Your output should be 'Misisipi' 
}
  end



  def reference
    "@value.squeeze"
  end

  def valid?(input)
    input.include?("squeeze")
  end
end
