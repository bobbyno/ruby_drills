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
      store({drill: name, input: input, type: 'command'})
    end

    def save(name, input, reference, result)
      store({drill: name, input: input, reference: reference, result: result, type: 'attempt'})
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
        t = Time.now
        @db[t.to_s] = entry.merge({ time: t })
      end
    end

  end
end
