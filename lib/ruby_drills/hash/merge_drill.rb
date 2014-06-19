class MergeDrill < Drill

  def setup
    @mismatched_animals = {"cat" => "woof", "dog" => "meow", "pig" => "oink" }
    @matched_animals = { "cat" => "meow", "dog" => "woof", "frog" => "ribbit"}
    @hints = ["http://www.ruby-doc.org/core-2.1.0/Hash.html#method-i-merge"]
  end

  def show
    puts %{We have two hashes:
@mismatched_animals: #{@mismatched_animals.inspect}
@matched_animals: #{@matched_animals.inspect}

Use the Hash method that will return a new hash with non-duplicate keys of
the first and second collectively. If the method uses a block it will
specify how to handle duplicate keys. Apply this to have a hash with
properly matched key/pair values of animals and sounds.
#{expected.inspect}:
    }
  end

  def reference
    "@matched_animals.merge(@mismatched_animals) { |key, v1, v2| v1 } "
  end

  def valid?(input)
    input.include?('merge')
  end

end