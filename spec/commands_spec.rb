require 'spec_helper'

describe Commands do
  describe "#hint" do
    it "returns hints in order" do
      wrapper = Class.new do
        include Commands
        attr_accessor :hints
        def setup
          @hints = %w[first second third]
        end
      end.new
      wrapper.setup
      expect(wrapper).to receive(:puts).with("first").ordered
      expect(wrapper).to receive(:puts).with("second").ordered
      expect(wrapper).to receive(:puts).with("third").ordered
      expect(wrapper).to receive(:puts).with("first").ordered
      wrapper.hint
      wrapper.hint
      wrapper.hint
      wrapper.hint
    end
  end
end
