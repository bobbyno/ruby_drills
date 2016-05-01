require 'spec_helper'

describe Sessions::Timestamp do

  specify "collector format" do
    t = Time.parse("2011-10-17 22:38:00 +0600")
    Sessions::Timestamp.collector(t).should == "Oct 17, 2011 10:38:00 PM "
  end

end
