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
    # Resume here: Do sort and reduce next before the Chunk drill so that people can have a hope
    # of passing it.

    a = ChunkDrill.new
    a.add(AllNamesDrill.new)
      .add(AllDrill.new)
      .add(ZipDrill.new)
      .add(TakeWhileDrill.new)
    a.start
  end
end
