require 'spec_helper'

feature "editing step" do
  let!(:howto) {Factory(:howto)}
  let!(:step) {Factory(:step, :howto => howto)}

  before do
    visit '/'
    click_link howto.title
    click_link step.title
    click_link "Edit Step"
  end

  scenario "updating a step" do
    fill_in "Title", :with => "something new"
    click_button "Update Step"
    page.should have_content("Step has been updated.")
    within("#step") do
      page.should have_content("something new")
    end
  end

  scenario "updating a step with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Step"
    page.should have_content("Step has not been updated.")
  end
end