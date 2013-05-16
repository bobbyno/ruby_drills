module Commands
    GAMBLER = File.read(File.join(File.dirname(__FILE__), 'data/gambler.ascii'))

    # Each command returns a response indicating whether or not the drill is complete.
    def continue
        puts "\nPress any key to continue:"
        gets.chomp
        system('clear');
        true
    end

    def fail(message=nil)
        puts "\n\tnot yet...".yellow
        puts message.yellow unless message.nil?
        false
    end

    def win(input)
      puts "\n\t!!! WIN !!!\n".green

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
For each drill, type in some Ruby code. If your answer doesn't meet the
drill's requirements, you'll see 'not yet'.
Once you get the answer correct, you'll get a 'WIN' on the board.

These commands are also available to you:

          \thelp:\tthis screen
          \tshow:\tshow the problem description
          \thint:\tget unstuck
          \tback:\tback to the previous drill
          \tskip:\ton to the next drill
          \tclear:\tclear the screen
          \texit:\tend your session}
      false
    end

    def start
      drill = linked_drills[0]
      while true do
        drill.show
        begin
          input = Readline.readline("\n>> ", true)
        end while (!drill.done?(input))

        if (input == 'back')
          drill = drill.previous
          clear
        else
          break if (!drill.next)
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
