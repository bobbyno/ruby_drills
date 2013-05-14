class EnumerableDrills
  include Commands

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

  def drills
    # TODO: shuffle after initial list is complete
    [PartitionDrill.new, AllNamesDrill.new, AllDrill.new, ZipDrill.new, TakeWhileDrill.new, ChunkDrill.new]
  end
end
