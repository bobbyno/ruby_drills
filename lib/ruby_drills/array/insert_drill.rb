class DeleteDrill < Drill

  def setup
    @values = "love"
    @hints = ["ins.",
                  "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-delete"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Remove 'bob' from this string in order to return a much tamer version.

Use a non destructive method to remove 'bob' from this string and return 'cat':
}
  end

  def reference
    "@values.delete('bob')"
  end

  def valid?(input)
    input.include?("delete")
  end

end