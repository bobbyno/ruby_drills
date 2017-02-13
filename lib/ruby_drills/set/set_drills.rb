class SetDrills < Drills

  def banner
    %{
Ruby Drills: Sets: http://ruby-doc.org/stdlib-2.4.0/libdoc/set/rdoc/Set.html#method-i-difference

Set implements a collection of 'unordered' values with 'no duplicates'.
This is a hybrid of Array's intuitive inter-operation facilities and Hash's fast lookup.

Set is easy to use with Enumerable objects (implementing each).
Most of the initializer methods and binary operators accept generic Enumerable
objects besides sets and arrays. An Enumerable object can be converted to Set using the to_set method.

Set uses Hash as storage, so you must note the following points:

Equality of elements is determined according to Object#eql? and Object#hash.
Use #compare_by_identity to make a set compare its elements by their identity.
Set assumes that the identity of each element does not change while it is stored.
Modifying an element of a set will render the set to an unreliable state.
When a string is to be stored, a frozen copy of the string is stored instead
unless the original string is already frozen.
------------------------------------------------------------------
}
  end

end
