require 'spec_helper'

feature 'Creating steps' do
  before do
    Factory(:howto, :title => "Making a pb&j")
    visit '/'
    click_link "Making a pb&j"
    click_link "New Step"
  end

  scenario "Creating a step" do
    fill_in "Title", :with => "Get some bread"
    fill_in "Description", :with => "Make sure it's tasty bread"
    click_button "Create Step"
    page.should have_content("Step has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    fill_in "Title", :with => ""
    fill_in "Description", :with => ""
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end

end