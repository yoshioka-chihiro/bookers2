class ApplicationController < ActionController::Base
   # topページだけはログインしてなくても閲覧できる！
  # before_action :authenticate_user!, expect: [:top]
   before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にどこにいくか？
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
