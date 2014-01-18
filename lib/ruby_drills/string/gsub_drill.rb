class GsubDrill < Drill

  def setup
    @values = "make?this?a?real?sentence"
    @hints = ["you need to substitute all of the question marks",
                  "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub"]
  end

  def show
    puts %{
@values = #{@values.inspect}

 Nondestructively replace all occurrences of question marks and replace them with a space.

}
  end

  def reference
    "@values.gsub('?',' ')"
  end

  def valid?(input)
    input.include?("gsub")
  end

end