# frozen_string_literal: true

# for top page
class TopController < ApplicationController
  skip_before_action :require_login

  layout :false

  def index; end
end
