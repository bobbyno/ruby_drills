# Ruby Drills

Drills are used in sports to master specific movements. In basketball, players drill on free throws, three-pointers, and dribbling. In programming, drills provide a way to engage in deliberate practice
to develop skills in specific language features, API's, or idioms.

Scrimmages are used in sports to mimic the conditions and complexity of a game in order to integrate skills built in drills and develop teamwork. Drills complement more complex scrimmage practices such as Ruby Koans, Ruby Quiz, or work on an open-source project. Were we to use a Japanese expression, drills could also be thought of as 'Kihon', the simpler precursor to 'Kata'. Drills lack the complexity of a full project. They can be performed alone or with friends.

Challenges in Ruby Drills focus on a specific method. Answers typically consist of a single line. Your objective is to complete the drill with ease and joy, without consulting any external documentation. At first, you will most likely find this kind of practice neither easy nor joyful. Code on. Practice for a few days until your knowledge of these methods becomes automatic. Doing so will make your day to day programming more enjoyable by freeing up your mind to focus on higher-level, higher-value complexities than the syntax of the language.

## Getting Started

    $ gem install ruby_drills
    $ ruby_drills

Drills run in the command line. You answer questions in drills using a REPL. This practice has the benefit of preparing you for developing at the REPL, a useful technique for trying out langauge features or algorithms and a great complement to TDD.

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

## Community

Questions about Ruby Drills? Ideas about how to practice? Head over to the [Google Group](https://groups.google.com/forum/#!forum/ruby-drills).

## Analytics

As you interact with Ruby Drills, your answers are being saved in a remote Drill Collector API hosted by Tested Minds. No personally identifiable information is included in this data: At this time, we are interested in overall practice patterns and statistics, not individual user profiles. Activity data looks like:

    {
    "timestamp" : "May 5, 2013 12:03:51 AM CST",
    "result" : "pass",
    "input" : "@numbers.partition{|x | x.even?  }",
    "sessionId" : "2217-47e8-b80a-68b81c980c32",
    "drill" : "PartitionDrill",
    "type" : "attempt",
    "reference" : "@numbers.partition {|x| x.even? }"
    }

We're interested in questions like:

* Which drills are practiced most frequently?
* How long do people typically practice in a given session?
* What are the patterns behind an effective drill vs. one that is too easy or too hard?

This data will help us evolve the Ruby Drills experience. This could also form the basis of a more personalized experience, allowing you to review your progress and compare your practice sessions to others. More on this to come as we analyze the data collected and share the results with the community.

Ultimately, we'd like to find out if drill and practice in Ruby and other programming languages helps us solve more complex programming challenges. There is currently very little data available to researchers to help answer this question scientifically. Hopefully, the data collected in Ruby Drills can provide a piece of this puzzle.


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

## Contributors

* [Bobby Norton](https://twitter.com/bobbynorton)
* [David Chelimsky](https://twitter.com/dchelimsky)

## Acknowledgments

* Sarah Aslanifar at [Tested Minds](http://literate.ly) for early review and feedback.
* The inaugural Chicago [Dev Bootcamp](http://devbootcamp.com) class of June 2013 for inspiring the project in the first place.
* [Erik Allar](https://twitter.com/allareri) for endless encouragement and enthusiasm.
* [Bill Van Der Laan](https://twitter.com/Vanderln) and Rod Levy: The first UX testers
* [Tiffany Mikell](https://twitter.com/mikellsolution) and [Torey Hickman](https://twitter.com/toreyhickman) for feedback on how to incorporate Ruby Drills into the Dev Bootcamp curriculum.

## License

Ruby Drills is licensed under the Apache License, version 2.0. See the enclosed LICENSE.txt and NOTICE.txt for more information.
