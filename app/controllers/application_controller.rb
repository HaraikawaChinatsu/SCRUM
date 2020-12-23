class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  # 　def after_sign_in_path_for(resource)
  #     mypage_path(resource.id)
  # 　end

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_update_path_for(resource)
    mypage_path
  end


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email name password password_confirmation age target_weight weight
                                               public_status image body])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email name password password_confirmation age target_weight weight
                                               public_status image body])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end
end
