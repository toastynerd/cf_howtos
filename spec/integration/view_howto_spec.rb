require 'spec_helper'

feature "viewing howtos" do
  scenario "listing all howtos" do
    howto = Factory.create(:howto, :title => "Create an example")
    visit '/'
    click_link "Create an example"
    page.current_url.should == howto_url(howto)
  end
end

