# frozen_string_literal: true

# for OAuth
class OauthController < ApplicationController
  skip_before_action :require_login
  before_action :validate_email_domain, only: :callback

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

  def validate_email_domain
    return if ENV['LOGIN_ALLOW_DOMAIN_CSV'].blank?

    email = sorcery_fetch_user_hash(:google).dig(:user_info, 'email')
    if email.present?
      allow_domains = ENV['LOGIN_ALLOW_DOMAIN_CSV'].split(',')
      unless allow_domains.any? { |domain| email.end_with?("@#{domain}") }
        redirect_to(
          root_path,
          alert: "allow email domain : [#{ENV['LOGIN_ALLOW_DOMAIN_CSV']}]"
        )
      end
    end
  end
end
