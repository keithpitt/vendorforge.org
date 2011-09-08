require 'spec_helper'

describe PagesController do

  describe '#index' do

    before :each do
      get :index
    end

    it 'should be successfull' do
      response.should be_success
    end

  end

end
