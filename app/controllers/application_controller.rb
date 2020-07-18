class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protected
  def after_sign_in_path_for(resource)
      user_path(resource)
  end
  def after_sign_out_path_for(resource)
     root_path
  end

def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profle_image, :email, :postcode, :prefecture_code, :address_city, :address_street,:address_building])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時にnameを使用
    end
    def correct_user?(user)

      if current_user.nil?
        return false
      else
        user.id.equal?(current_user.id)
      end
    end
end