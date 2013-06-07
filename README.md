# Ruby Drills

Drills are used in sports to master specific movements. In basketball, players drill on free throws, three-pointers, and dribbling. In programming, drills provide a way to engage in deliberate practice
to develop skills in specific language features, API's, or idioms.

Scrimmages are used in sports to mimic the conditions and complexity of a game in order to integrate skills built in drills and develop teamwork. Drills complement more complex scrimmage practices such as Ruby Koans, Ruby Quiz, or work on an open-source project. Were we to use a Japanese expression, drills could also be thought of as 'Kihon', the simpler precursor to 'Kata'. Drills lack the complexity of a full project. They can be performed alone or with friends.

Challenges in Ruby Drills focus on a specific method. Answers typically consist of a single line. Your objective is to complete the drill with ease and joy, without consulting any external documentation. At first, you will most likely find this kind of practice neither easy nor joyful. Code on. Practice for a few days until your knowledge of these methods becomes automatic. Doing so will make your day to day programming more enjoyable by freeing up your mind to focus on higher-level, higher-value complexities than the syntax of the language.

## Getting Started

Ruby Drills will eventually be released as a gem. While the project is in "open secret" mode, run it using bundler:

    git clone git@github.com:bobbyno/ruby_drills.git
    cd ruby_drills
    bundle install
    bundle exec bin/ruby_drills

Drills run in the command line. You answer questions in drills using a REPL. This practice has the benefit of preparing you for developing at the REPL, a useful technique for trying out langauge features or algorithms.

Start by choosing an available drill from the menu. The Enumerable drill currently has the most
content, so start there!

## Example

A drill session for the `Enumerable#zip` method might consist of the following:

    We have two arrays:
    a: [4, 5, 6]
    b: [7, 8, 9]

    Use a method from the Enumerable mixin that will take one element from
    a new array and merge the corresponding elements from a and b to yield
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]]:

    >> c = [1,2,3]
    => [1, 2, 3]

        not yet...

    >> c.zip(a, b)
    => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

        !!! WIN !!!

    How does your answer compare to the reference solution?
    [1,2,3].zip(@a, @b)

    Press any key to continue:

## Installation

Once we're out of 'open secret' mode, Ruby Drills are meant to be used as a standalone tool from the command line:

    $ gem install ruby_drills

Run:

    $ ruby_drills

## Data

At the moment, drill session data is being saved to a PStore at `/usr/local/var/ruby_drills`. This will soon move to a web-based solution. Over time, we'll be able to analyze how people are practicing. This has the potential to lead to interesting research for the Ruby community about how people practice and learn. By using and contributing to Ruby Drills, you're contributing to science!

## Community

rubydrills.com is registered and will eventually link to summarized statistics about how much practice is getting done.

Once we go public, we can set up a Google Group for discussion. At the moment, please send questions and feedback to bobby@testedminds.com.

## Under the Hood: The Drill API

Each drill consists of five methods:

`setup`: initialize instance variables used in the drill.

`show`: puts a string that describes the drill.

`hints`: return an array of hints that will be randomly shown.

`reference`: provide a reference solution as valid ruby code in string form. This will be eval'ed to determine if the user's input should be validated.

`valid?(input)`: a validation function that returns true or false. Used to see if a user's input that matches the reference solution meets other constraints.

## Contributing

Please check the [Issues List](http://github.com/bobbyno/ruby_drills/issues) on Github to find something to do.

If you're new to Github:

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create passing specs or cukes (once we figure out the testing strategy)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## Credits

* [Bobby Norton](http://twitter.com/bobbynorton)
* Sarah Aslanifar at [Tested Minds](http://literate.ly)
* The inaugural Chicago [Dev Bootcamp](http://devbootcamp.com) class of June 2013
* You?
