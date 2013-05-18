class WelcomeDrills
  include Commands

  def banner
    welcome
  end

  def start
    help
    continue
  end

end
