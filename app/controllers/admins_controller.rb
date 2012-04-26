class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:success] = "Welcome to LoboBlanca.org!"
      redirect_to @admin
    else
      render 'new'
    end
  end
end
