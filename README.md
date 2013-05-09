# Ruby Drills

Drills are used in sports to master specific movements. In basketball, players drill on free throws, three-pointers, and dribbling. Scrimmages, on the other hand, are used to mimic the conditions and complexity of a game in order to integrate skills built in drills and develop teamwork.

In programming, drills are useful for developing skills in specific language features, API's, or idioms. Drills lack the complexity of a full project. They can be performed alone or with others. Drills complement more complex scrimmage practices such as Ruby Koans, Ruby Quiz, or work on an open-source project. Were we to use a Japanese expression, drills could also be thought of as 'Kihon', the simpler precursor to 'Kata'. Drills provide a way to engage in the [deliberate practice](http://en.wikipedia.org/wiki/Practice_(learning_method)#Deliberate_practice) of programming as a way to explore a new langauge or API or perfect technique.

Coding Drills are a way to engage in deliberate practice to master a language. Challenges in Ruby Drills are focused on a specific method. Answers typically consist of a single line. Your objective is to complete the drill with ease and joy, without consulting any external documentation.

For example, a drill for the `Enumerable#zip` method could consist of the following:

    We have two arrays:
    a: [4, 5, 6]
    b: [7, 8, 9]

    Use a method from the Enumerable mixin that will take one element from
    a new array and merge the corresponding elements from a and b to yield
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]]:

    >> [1,2,3].zip(a, b)

    Nice one!

## Installation

Ruby Drills are meant to be used as a standalone tool from the command line:

    $ gem install ruby_drills

Run:

    $ ruby_drills

## Usage

Drills run in the command line. You answer questions in drills using a REPL. This practice has the benefit of preparing you for developing at the REPL, a useful technique for trying out langauge features or algorithms.
Start by choosing an available drill from the menu.

    Arrays
    Hashes
    Enumerable
    Strings

The drills will then walk you through one-line challeges that will allow you to demonstrate your mastery of the API.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create passing specs
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
