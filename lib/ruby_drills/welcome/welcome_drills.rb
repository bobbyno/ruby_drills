class WelcomeDrills
  include Commands

  def banner
     %{
Welcome to Ruby Drills!

Drills are a way to engage in deliberate practice to master a language.
Challenges in Ruby Drills focus on a specific method.
Answers typically consist of a single line.
Your objective is to complete the drill with ease and joy,
without consulting any external documentation.

------------------------------------------------------------------
}
  end

  def start
    help
    continue
  end

end
