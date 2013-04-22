class RubyDrills

  # Manage the processing of command line options
  class CLI

    class << self

      # @return [Proc] The Proc defining the valid command line options.
      attr_accessor :options

      # @return [Array] The Procs that process the parsed options.
      attr_accessor :option_processors

      # @return [Array<String>] The input array of strings to process
      #   as CLI options.
      attr_accessor :input_args

      # Add another set of CLI options (a Slop block)
      def add_options(&block)
        if options
          old_options = options
          self.options = proc do
            instance_exec(&old_options)
            instance_exec(&block)
          end
        else
          self.options = block
        end
        self
      end

      # Add a block responsible for processing parsed options.
      def process_options(&block)
        self.option_processors ||= []
        option_processors << block
        self
      end

      # Clear `options` and `option_processors`
      def reset
        self.options = nil
        self.option_processors = nil
      end

      def parse_options(args=ARGV.dup)
        unless options
          raise NoOptionsError, "No command line options defined! Use RubyDrills::CLI.add_options to add command line options."
        end

        self.input_args = args

        opts = Slop.parse!(args, :help => true, :multiple_switches => false, &options)

        # Option processors are optional.
        if option_processors
          option_processors.each { |processor| processor.call(opts) }
        end

        self
      end

    end

    reset
  end
end

RubyDrills::CLI.add_options do
  on :v, :version, "Display the version" do
    puts "RubyDrills version #{RubyDrills::VERSION} on Ruby #{RUBY_VERSION}"
    exit
  end
end.process_options do |opts|
  exit if opts.help?
  RubyDrills.start
end
