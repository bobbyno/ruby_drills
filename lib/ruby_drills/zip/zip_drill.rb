class ZipDrill

    def welcome
      %{
        Ruby Drills: Enumerable

        Enumerable

        The Enumerable mixin provides collection classes with several
        traversal and searching methods, and with the ability to sort.
        In this drill, you'll practice the methods in the enumerable mixin
        and will make a Ruby class Enumerable.

      }
    end

    def zip
      a = [ 4, 5, 6 ]
      b = [ 7, 8, 9 ]

      puts "We have two arrays:"
      puts "a: #{a.inspect}"
      puts "b: #{b.inspect}"

      answer = nil
      expected = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
      incorrect = true

      while (incorrect)
        puts %{
          Which Enumerable method will take one element from a new array and
          merge the corresponding elements from a and b to yield #{expected.inspect}

          Store the results in a variable called 'answer':
        }
        Pry.start binding, :quiet => true
        incorrect = (answer != expected)
        if !incorrect
          puts "Nice one!"
          next
        end

        if answer.nil?
          puts "Did you forget to store your expression in a variable called 'answer'?"
        elsif answer == 'quit'
          puts "Do or do not...there is no try."
          break
        elsif answer == 'hint'
          puts "http://ruby-doc.org/core-1.9.3/Enumerable.html#method-i-zip"
        else
          puts "answer is #{answer}"
          puts "Do or do not...there is no try."
        end

      end
    end

    puts welcome
    config_pry
    zip
  end
