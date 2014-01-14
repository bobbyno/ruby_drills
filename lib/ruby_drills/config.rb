module RubyDrills
  class Config

    SESSIONS = Sessions::CollectorClient.new

    def self.pry_config
      Pry.config.pager = false

      Pry.config.prompt = [
        proc { |target_self, nest_level, pry|
          "#{":#{nest_level}" unless nest_level.zero?}>> "
          },
          proc { |target_self, nest_level, pry|
            "#{":#{nest_level}" unless nest_level.zero?}* "
          }
        ]
    end
  end
end
