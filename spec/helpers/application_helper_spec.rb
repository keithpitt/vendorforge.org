require 'spec_helper'

describe ApplicationHelper do

  describe "#format_url" do
    [
      [ "foo.com",                 "http://foo.com" ],
      [ "foo.com/bar",             "http://foo.com/bar" ],
      [ "com/bar",                 "http://com/bar" ],
      [ "://com/bar",              nil ],
      [ nil,                       nil ],
      [ "https://foo.com/bar",     "https://foo.com/bar" ],
      [ "http://foo.com/bar",      "http://foo.com/bar" ],
      [ "http://foo.com/bar?foo",  "http://foo.com/bar?foo" ]
    ].each do |url|

      it "should format #{url[0].inspect} to #{url[1].inspect}" do
        format_url(url[0]).should == url[1]
      end

    end

  end

end
