class HowtosController < ApplicationController
  before_filter :find_howto, :only => [:show, :edit, :update, :destroy]
  def index
    @howtos = Howto.all
  end

  def new
    @howto = Howto.new
  end

  def create
    @howto = Howto.new(params[:howto])
    if @howto.save
      flash[:notice] = "Howto has been created."
      redirect_to @howto
    else
      flash[:alert] = "Could not create howto."
      render :action => "new"
    end
  end

  def show
    #
  end

  def edit
    #
  end

  def update
    if @howto.update_attributes(params[:howto])
      flash[:notice] = "Howto has been updated."
      redirect_to @howto
    else
      flash[:alert] = "Howto was not updated."
      render :action => "edit"
    end
  end

private

  def find_howto
    @howto = Howto.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The howto you were looking for could not be found."
    redirect_to howtos_path
  end

end
