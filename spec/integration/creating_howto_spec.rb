require 'spec_helper'

feature "creating new howtos" do
  before do
    visit '/'
    click_link "New Howto"
  end

  scenario "should be able to create a new howto" do
    fill_in "Title", :with => "Example Howto"
    fill_in "Description", :with => "All about how to create an example howto"
    click_button "Create Howto"
    page.should have_content("Howto has been created.")
  end

  scenario "should not be able to have a blank howto" do
    fill_in "Title", :with => ""
    fill_in "Description", :with => ""
    click_button "Create Howto"
    page.should have_content("Could not create howto.")
    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
  end
end