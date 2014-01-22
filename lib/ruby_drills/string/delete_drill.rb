class DeleteDrill < Drill

  def setup
    @value = "bobcat"
    @hints = ["bob needs to be deleted before you can let this into the house...",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-delete"]
  end

  def show
    puts %{
@value = #{@value.inspect}

Remove 'bob' from this string in order to return a much tamer version.

Use a non-destructive method to remove 'bob' from this string and return 'cat':
}
  end

  def reference
    "@value.delete('bob')"
  end

  def valid?(input)
    non!("delete", input)
  end

end
