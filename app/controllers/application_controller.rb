class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   case resource
  #   when Admin #Adminモデル
  #     admin_root_path #遷移先のパス
  #   when User
  #     root_path
  #   end
  # end


def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_root_path
    else
        mypage_path
    end
end


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  # def search
  #   @movies = Movie.search(params[:keyword])
  #   @keyword = params[:keyword]
  #   render "top"
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end