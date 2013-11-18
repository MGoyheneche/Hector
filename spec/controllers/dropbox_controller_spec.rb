require 'spec_helper'

describe DropboxController do

  describe "GET 'authorize'" do
    it "returns http success" do
      get 'authorize'
      response.should be_success
    end
  end

  describe "GET 'authorized_callback'" do
    it "returns http success" do
      get 'authorized_callback'
      response.should be_success
    end
  end

  describe "GET 'create_user_and_return_home'" do
    it "returns http success" do
      get 'create_user_and_return_home'
      response.should be_success
    end
  end

end
