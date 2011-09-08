require 'spec_helper'

describe User do

  it { should have_many(:versions) }
  it { should have_many(:vendors) }

  it "should create an API token after create"

  describe ".find_for_database_authentication"do

    it "should allow you to login via a username"

    it "should allow you to authenticate via an email address"

  end

  describe ".find_recoverable_or_initialize_with_errors"do

    it "should do something"

  end

  describe "#find_record" do

    it "should return a user matching the username"

    it "should return a user matching the email address"

  end

end
