class AdminsController < ApplicationController

  def index
  #
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      # sign_in @user -- see sessions_controller.rb
      flash[:success] = "Welcome to LoboBlanca.org!"
      redirect_to @admin
    else
      render 'new'
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
    def update
      @admin = Admin.find(params[:id])
      if @admin.update_attributes(params[:admin])
        flash[:success] = "Admin info updated"
        # sign_in @user
        redirect_to @admin
      else
        render 'edit'
      end
    end

    def destroy
  #
    end
end
