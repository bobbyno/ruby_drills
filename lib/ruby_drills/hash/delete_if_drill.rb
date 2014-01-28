class DeleteIfDrill < Drill

  def setup
    @dog_breeds = { "black lab" => "medium", "chihuahua" => "small", "pitbull" => "medium",
                    "poodle" => "small", "great dane" => "large"}
    @hints = ["http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-delete_if"]
  end

  def show
    puts %{We have one hash:
@dog_breeds: #{@dog_breeds.inspect}

Use the Hash method that will remove any key/value pairs specified in a block and return
a hash with all those key/value pairs that do not meet the condition(s) specified in the
block. The resulting hash should return only small and medium dog breeds.
#{expected.inspect}:
    }
  end

  def reference
    "@dog_breeds.delete_if { |dog, size| size == 'large' } "
  end

  def valid?(input)
    input.include?('delete_if')
  end

end