class Commands
  class << self

    def continue
        puts "\nPress any key to continue:"
        gets.chomp
        system('clear');
    end

    def fail(message=nil)
        puts "\n\tnot yet...".yellow
        puts message.yellow unless message.nil?
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
    end

    def exit
      system('clear')
      puts %{
        Mastery...the mysterious process during which what is at first difficult
        becomes progressively easier and more pleasurable through practice.

                                                              --- George Leonard}
      puts
    end

    def welcome
    puts %{
Welcome to Ruby Drills!

Drills are a way to engage in deliberate practice to master a language.
Challenges in Ruby Drills focus on a specific method.
Answers typically consist of a single line.
Your objective is to complete the drill with ease and joy,
without consulting any external documentation.

------------------------------------------------------------------
}
    end

  end
end
