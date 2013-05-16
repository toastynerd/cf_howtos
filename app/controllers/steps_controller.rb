class StepsController < ApplicationController
  before_filter :find_howto
  before_filter :find_step, :only => [:show,:edit,:update,:destroy]

  def new
    @step = @howto.steps.build
  end

  def create
    @step = @howto.steps.build(params[:step])
    if @step.save
      flash[:notice] = "Step has been created."
      redirect_to [@howto, @step]
    else
      flash[:alert] = "Step has not been created."
      render :action => "new"
    end
  end

  def show
    #
  end

private
  def find_howto
    @howto = Howto.find(params[:howto_id])
  end

  def find_step
    @step = @howto.steps.find(params[:id])
  end

end
