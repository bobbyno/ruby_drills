class GsubDrill < Drill

  def setup
    @values = "make?this?a?real?sentence"
    @hints = ["you need to substitute all of the question marks globally",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Non-destructively replace all occurrences of question marks and replace them with a space
to return #{expected.inspect}.

}
  end

  def reference
    "@values.gsub('?',' ')"
  end

  def valid?(input)
    non!("gsub", input)
  end

end
