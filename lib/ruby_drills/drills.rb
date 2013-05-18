class Drills
  include Commands

  def start
    drill = linked_drills[0]
    while drill do
      drill.show

      begin
        input = Readline.readline("\n>> ", true)
      end while (!drill.done?(input))

      case input
      when 'back'
        drill = drill.previous
        clear
      when 'menu'
        break
      else
        drill = drill.next
        continue
      end

    end
  end

  # Creates a linked list from the array of drills
  def linked_drills
    ordered_drills.tap do |linked|
      for i in 0..linked.size-1
        linked[i].previous = linked[i-1] unless (i == 0)
        linked[i].next = linked[i+1] unless (i == linked.size-1)
      end
    end
  end

  # deliver drills in random order
  def ordered_drills
    drills.shuffle
  end

  # Determines the list of drills in this directory
  def drills
    mod = self.class.name.gsub(/Drills/, '').downcase
    Dir["#{File.dirname(__FILE__)}/#{mod}/*drill.rb"].map do |f|
      require f
      name = File.basename(f, '.rb')
      clazz = name.split('_').map(&:capitalize).join
      Module.const_get(clazz).new
    end
  end
end
