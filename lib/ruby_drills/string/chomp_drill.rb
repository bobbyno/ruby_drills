class ChompDrill < Drill

  def setup
    @value = "Blueberry"
    @hints = ["Would not be a very big bite, but go ahead and take one.",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-chomp"]
  end

  def show
    puts %{
@value = #{@value.inspect}

Make this delectable berry read as just its color!

Use the method that will remove 'berry' from the end of this string and return 'Blue':
}
  end

  def reference
    "@value.chomp('berry')"
  end

  def valid?(input)
    non!("chomp", input)
  end

end
