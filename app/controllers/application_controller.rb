class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!

# 　def after_sign_in_path_for(resource)
#     mypage_path(resource.id)
# 　end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation, :age, :target_weight, :weight, :public_status])
  end



end
