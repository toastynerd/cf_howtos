require 'spec_helper'

feature "viewing tickets" do
  before do
    pbj = Factory(:howto, :title => "example howto")
    Factory(:step,
            :howto => pbj,
            :title => "get some bread",
            :description => "make sure it's good bread.")

    example2 = Factory(:howto, :title => "example2")
    Factory(:step,
            :howto => example2,
            :title => "make another one",
            :description => "make sure it's super awesome")
    visit '/'
  end

  scenario "View steps for a given project" do
    click_link "example howto"
    page.should have_content("get some bread")
    page.should_not have_content("make another one")

    click_link "get some bread"
    within("#steps li") do
      page.should have_content("get some bread")
    end
    page.should have_content("make sure it's good bread.")
  end
end