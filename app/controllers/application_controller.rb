class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :log_params, unless: -> { Rails.env.production? }

  def log_params
    Rails.logger.ap params
  end


  def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for(resource)
    products_path
  end

end
