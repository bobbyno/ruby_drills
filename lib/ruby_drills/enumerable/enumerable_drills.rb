Dir['./lib/ruby_drills/enumerable/*drill.rb'].each do |f|
  require f
end

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
    a = AllNamesDrill.new
    a.add(AllDrill.new)
      .add(ZipDrill.new)
      .add(TakeWhileDrill.new)
      .add(ChunkDrill.new)
    a.start
  end
end
