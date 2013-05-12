module Commands
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
      puts "\nYou got to know when to hold 'em, know when to fold 'em...\n".yellow
      true
    end

    def hint
      puts hints[rand(0...hints.size)]
      false
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
          \tclear:\tclear the screen
          \tshow:\tshow the problem description
          \thint:\tget unstuck
          \tskip:\tmove on to the next drill
          \texit:\tend your session}
      false
    end

    def start
      drills.each do |drill|
        drill.show
        begin
          input = Readline.readline("\n>> ", true)
        end while (!drill.done?(input))
        continue
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
