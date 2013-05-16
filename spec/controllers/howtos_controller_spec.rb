require 'spec_helper'

describe HowtosController do
  it "displays an error for a missing howto" do
    get :show, :id => "not-here"
    response.should redirect_to(howtos_path)
    message = "The howto you were looking for could not be found."
    flash[:alert].should == message
  end

end
