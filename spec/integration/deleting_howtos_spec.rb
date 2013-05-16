require 'spec_helper'

feature "deleting howto" do
  scenario "should be able to delete a howto" do
    Factory(:howto, :title => "Create a howto")
    visit '/'
    click_link "Create a howto"
    click_link "Delete Howto"
    page.should have_content("Howto has been deleted.")

    visit '/'
    page.should_not have_content("Create a howto")
  end
end