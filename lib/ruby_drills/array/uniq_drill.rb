class UniqDrill < Drill

  def setup
    @shopping_list = [ "apples", "oranges", "grapes", "bananas", "toothpaste", "bread", "apples", "oranges" ]
    @hints = ["You do not need to search the array, use a method that does that for you.",
                  "https://ruby-doc.org/core-2.3.0/Array.html#method-i-delete"]
  end

  def show
    puts %{
@shopping_list = #{@shopping_list.inspect}
I need my shopping_list to contain unique items.
}
  end

  def reference
    "@shopping_list.uniq"
  end

  def valid?(input)
    input.include?("uniq")
  end

end
