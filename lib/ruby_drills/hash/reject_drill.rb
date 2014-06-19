class RejectDrill < Drill

  def setup
    @dog_breeds = { "black lab" => "medium", "chihuahua" => "small", "pitbull" => "medium",
                    "poodle" => "small", "great dane" => "large"}
    @hints = ["http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-reject"]
  end

  def show
    puts %{
We have a hash:
@dog_breeds: #{@dog_breeds.inspect}

Filter this hash to return only small and medium dog breeds:
#{expected.inspect}

Use the Hash method that "returns a new hash consisting of entries for which the block returns false":
}
  end

  def reference
    "@dog_breeds.reject {|dog, size| size == 'large' }"
  end

  def valid?(input)
    input.include?('reject')
  end

end
