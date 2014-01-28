class GroupByDrill < Drill

  def setup
    @mario_bros = { "Mario"=>"good", "Luigi"=>"good", "Bowser"=>"evil", "Peach"=>"good", "Toad"=>"good", "Yoshi" => "superb" }
    @hints = ["http://ruby-doc.org/core-2.1.0/Enumerable.html#method-i-group_by"]
  end

  def show
    puts %{We have one hash:
@mario_bros: #{@mario_bros.inspect}

Use the Enumerable method that will return a hash of key/value pairs where the keys values and the
values are an array of key/value pairs. The resulting hash should organize the Mario Bros by their
personality!
#{expected.inspect}:
    }
  end

  def reference
    "@mario_bros.group_by { |character, personality| personality } "
  end

  def valid?(input)
    input.include?('group_by')
  end

end