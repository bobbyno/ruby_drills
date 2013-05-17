module Commands
    GAMBLER = File.read(File.join(File.dirname(__FILE__), 'data/gambler.ascii'))

    # Each command returns a response indicating whether or not the drill is complete.
    def continue
      puts "\nPress any key to continue:"
      Chomper.get_char
      system('clear');
      true
    end

    def fail(input, message=nil)
      puts "\n\tnot yet...".yellow
      RubyDrills::SESSIONS.save(self.class.name, input, reference, 'fail')
      puts message.yellow unless message.nil?
      false
    end

    def win(input)
      puts "\n\t!!! WIN !!!\n".green
      RubyDrills::SESSIONS.save(self.class.name, input, reference, 'pass')
      if (reference != input.strip)
        puts "How does your answer compare to the reference solution?"
        puts reference
      end
      true
    end

    def skip
      puts "\n\tskipping...for now...".yellow
      true
    end

    def review
      puts "\n\t#{reference}".green
      puts "\n\ttry this one again soon...".yellow
      true
    end

    def fold
      puts GAMBLER
      puts "\nYou got to know when to hold 'em, know when to fold 'em...\n".yellow
      true
    end

    def hint
      puts hints[rand(0...hints.size)]
      false
    end

    def back
      puts "\tYou're already at the first drill".yellow if !previous
      previous
    end

    def clear
      system('clear')
      false
    end

    def help
        puts %{
For each drill, type in some Ruby.
Answer correctly and you'll get a 'WIN' on the board.
Otherwise, you'll see 'not yet'.

These commands are also available to you:

      help:\tthis screen
      show:\tshow the problem description
      hint:\tget unstuck
      back:\tback to the previous drill
      skip:\ton to the next drill
      review:\tsee the answer
      clear:\tclear the screen
      exit:\tend your session}
      false
    end

    def start
      drill = linked_drills[0]
      while drill do
        drill.show
        begin
          input = Readline.readline("\n>> ", true)
        end while (!drill.done?(input))

        if (input == 'back')
          drill = drill.previous
          clear
        else
          drill = drill.next
          continue
        end
      end
    end

    def linked_drills
      drills.tap do |linked|
        for i in 0..linked.size-1
          linked[i].previous = linked[i-1] unless (i == 0)
          linked[i].next = linked[i+1] unless (i == linked.size-1)
        end
      end
    end

    def quit
      system('clear')
      puts %{
        Mastery...the mysterious process during which what is at first difficult
        becomes progressively easier and more pleasurable through practice.

                                                              --- George Leonard}
      puts
      exit
    end

end
