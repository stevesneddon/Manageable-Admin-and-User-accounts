class AdminsController < ApplicationController
  def show
    @admin = Admin.find(params[:id])
  end

  def new
  end
end
