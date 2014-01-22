class SqueezeDrill < Drill

  def setup
    @value = %{Mississippi}
    @hints = ["How do you get toothpaste out of a tube?",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-squeeze"]
  end

  def show
    puts %{
@value = #{@value.inspect}

Remove all of the repeating characters from Mississippi,
leaving only one instance of each, to product #{expected.inspect}.

}
  end

  def reference
    "@value.squeeze"
  end

  def valid?(input)
    non!("squeeze", input)
  end
end
