require 'ruby_drills/enumerable/zip_drill'

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
    ZipDrill.new.run
    puts "next drill starting now..."
  end
end
