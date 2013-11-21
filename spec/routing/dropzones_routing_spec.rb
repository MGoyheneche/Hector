require "spec_helper"

describe DropzonesController do
  describe "routing" do

    it "routes to #index" do
      get("/dropzones").should route_to("dropzones#index")
    end

    it "routes to #new" do
      get("/dropzones/new").should route_to("dropzones#new")
    end

    it "routes to #show" do
      get("/dropzones/1").should route_to("dropzones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dropzones/1/edit").should route_to("dropzones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dropzones").should route_to("dropzones#create")
    end

    it "routes to #update" do
      put("/dropzones/1").should route_to("dropzones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dropzones/1").should route_to("dropzones#destroy", :id => "1")
    end

  end
end
