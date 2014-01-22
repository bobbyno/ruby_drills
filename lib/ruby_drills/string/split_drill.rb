class SplitDrill < Drill

  def setup
    @words = %{under
the
ocean}
    @hints = ["Use the '\n' char as the splitting point. You might need double quotes, though...",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-split"]
  end

  def show
    puts %{
@words = #{@words.inspect}

Take each line and make it the member of an array.

Use the method that will break up the string by the new line character,
and returns an array with each line as a member:
}
  end

  def reference
    "@words.split('\n')"
  end

  def valid?(input)
    non!("split", input)
  end
end
