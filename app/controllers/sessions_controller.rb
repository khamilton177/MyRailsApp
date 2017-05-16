class SessionsController < ApplicationController
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def sign_in_form
  end

  def sign_in
    @user = User.find_by(username: params[:username])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "You have been signed in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Your username/password combination invalid"
      redirect_to :back
    end
  end

  def sign_out_now
    redirect_to :sign_out
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end