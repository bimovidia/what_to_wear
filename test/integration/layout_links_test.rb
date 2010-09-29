require 'test_helper'

class LayoutLinksTest < ActionDispatch::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  describe "LayoutLinks" do

    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Home")
    end

  end
end
