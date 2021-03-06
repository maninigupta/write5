require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password_digest])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
