require 'spec_helper'

feature "deleteing steps" do
  let!(:howto) {Factory(:howto)}
  let!(:step) {Factory(:step, :howto => howto)}

  before do
    visit '/'
    click_link howto.title
    click_link step.title
  end  

  scenario "deleting a step" do
    click_link "Delete Step"
    page.should have_content("Step has been deleted.")
    page.current_url.should == howto_url(howto)
  end
end

