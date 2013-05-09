Dir['./lib/ruby_drills/enumerable/*drill.rb'].each do |f|
  require f
end
require 'readline'

class EnumerableDrills

  def banner
    %{
Ruby Drills: Enumerable

The Enumerable mixin provides collection classes with several
traversal and searching methods, and with the ability to sort.
In this drill, you'll practice the methods in the enumerable mixin
and will make a Ruby class Enumerable.

------------------------------------------------------------------
}
  end

  def start
    drills.each do |drill|
      drill.show
      begin
        input = Readline.readline("\n>> ", true)
      end while (!drill.done?(input))
      Commands.continue
    end
  end

  def drills
    [AllNamesDrill.new, AllDrill.new, ZipDrill.new, TakeWhileDrill.new, ChunkDrill.new]
  end
end
