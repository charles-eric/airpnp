module Users
  class RegistrationsController < Devise::RegistrationsController
      before_action :configure_permitted_parameters

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) << [:phonenumber, :firstname, :lastname, :picture]
      devise_parameter_sanitizer.for(:sign_up)        << [:phonenumber, :firstname, :lastname]
    end
  end
end