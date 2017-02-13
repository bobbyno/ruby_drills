class DeleteDrill < Drill

  def setup
    @values = [ "a", "b", "b", "b", "c" ]
    @hints = ["It's the method you think it is!",
              "https://ruby-doc.org/core-2.3.0/Array.html#method-i-delete"]
  end

  def show
    puts %{
@values = #{@values.inspect}
Use a method to delete "b" from the array of values.
}
  end

  def reference
    "@values.delete(\"b\")"
  end

  def valid?(input)
    input.include?("delete(\"b\")")
  end

end
