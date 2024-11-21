class ApplicationController < ActionController::Base
  before_action :debug_redirect

  def debug_redirect
    Rails.logger.info("Redirecting: #{request.host} to #{request.url}")
  end
end
