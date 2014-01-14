module Sessions
  class Timestamp

    def self.collector(t = Time.now)
      t.strftime("%b %-d, %Y %-l:%M:%S %p %Z")
    end

  end
end
