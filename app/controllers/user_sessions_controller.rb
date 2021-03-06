# frozen_string_literal: true

# for login/logout
class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: %i[destroy]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
