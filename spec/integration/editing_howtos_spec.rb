require 'spec_helper'

feature "editing a howto" do
  before do
        Factory(:howto, :title => "Creating a howto")
    visit '/'
    click_link "Creating a howto"
    click_link "Edit Howto"
  end

  scenario "updating a howto" do
    fill_in "Title", :with => "Howto create a howto"
    click_button "Update Howto"
    page.should have_content("Howto has been updated.")
  end

  scenario "should not update a blank form" do
    fill_in "Title", :with => ""
    click_button "Update Howto"
    page.should have_content("Howto was not updated.")
  end
end