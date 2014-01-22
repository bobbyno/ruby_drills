class PartitionDrill < Drill

  def setup
    @sentence = "Half full or half empty?"
    @hints = ["use 'or' as the argument",
              "http://www.ruby-doc.org/core-1.9.3/String.html#method-i-partition"]
  end

  def show
    puts %{
@sentence = #{@sentence.inspect}

Break this sentence into a three-member array with a method that will use 'or'
as the substring to match against.

Your output should be ['Half full ', 'or', ' half empty?']:

}
  end

  def reference
    "@sentence.partition('or')"
  end

  def valid?(input)
    input.include?("partition")
  end

end
