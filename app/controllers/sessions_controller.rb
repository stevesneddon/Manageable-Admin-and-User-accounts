class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      admin = Admin.find_by_email(params[:session][:email])
      if admin && admin.authenticate(params[:session][:password])
        current_admin = admin
      else
        current_admin = nil # better safe than sorry
      end
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
