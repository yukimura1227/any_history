# frozen_string_literal: true

# for OAuth
class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    @user = login_from(provider)
    if @user
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)

        redirect_to root_path, notice: 'ログインに成功しました'
      rescue
        redirect_to root_path, alert: 'ログインに失敗しました'
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
