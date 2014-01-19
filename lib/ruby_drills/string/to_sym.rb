class ToSymDrill < Drill

  def setup
    @values = %{mouse}
    @hints = ["Use the '\n' char as the splitting point.",
                  "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-to_sym"]
  end

  def show
    puts %{
@values = #{@values.inspect}

Take this string and turn it into a symbol. The output should be ':mouse': 
}
  end

  def reference
    "@values.to_sym"
  end

  def valid?(input)
    input.include?("to_sym")
  end
end

