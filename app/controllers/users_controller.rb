# frozen_string_literal: true

# For User Resource
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
