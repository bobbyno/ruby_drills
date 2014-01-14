require 'securerandom'
require 'httparty'

module Sessions
  class CollectorClient
    include HTTParty
    base_uri 'https://drill-collector.herokuapp.com'
    # base_uri 'http://localhost:9091'
    # debug_output $stderr

    attr_reader :session_id

    def initialize
      @session_id = SecureRandom.urlsafe_base64
    end

    def command(name, input)
      store({context: name, input: input, type: 'command'})
    end

    def attempt(name, input, reference, result)
      store({context: name, input: input, reference: reference, result: result, type: 'attempt'})
    end

 private

    def store(entry)
      begin
        Thread.new do
          data = entry.merge(timestamp: Sessions::Timestamp.collector, session_id: @session_id)
          self.class.post('/record', {:body => data})
        end
      rescue
        # silent scream for now...
      end
    end

  end
end
