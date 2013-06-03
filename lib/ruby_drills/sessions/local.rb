require 'fileutils'
require 'pstore'

module Sessions
  class Local
    include FileUtils

    DIR = '/usr/local/var/ruby_drills'

    def initialize
      ensure_directory_exists
      @db = PStore.new(File.join(DIR, 'progress.pstore'))
    end

    def command(name, input)
      store({context: name, input: input, type: 'command'})
    end

    def save(name, input, reference, result)
      store({context: name, input: input, reference: reference, result: result, type: 'attempt'})
    end

    def stats
      @db.transaction(true) do
        @db.roots.each do |key|
          puts @db[key].inspect
        end
      end
    end

  private

    def ensure_directory_exists
      FileUtils.mkdir_p(DIR) if !File.exists?(DIR)
    end

    def store(entry)
      @db.transaction do
        t = rfc822
        @db[t.to_s] = entry.merge({ time: t })
      end
    end

    def rfc822
      Time.now.strftime('%a, %d %b %Y %H:%M:%S %z')
    end

  end
end
