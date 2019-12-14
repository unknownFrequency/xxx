# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    resource = User.find_by(email: params[:user][:email])
    resource.inspect
    if resource&.valid_password?(authenticate_encryptor)
      set_flash_message!(:notice, "Velkommen #{resource.name}")
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to new_user_session_path, alert: "Forkert e-mail eller password"
    end
  end

  def authenticate_encryptor
    private_key = OpenSSL::PKey::RSA.new(PRIVATE_KEY)
    password = params[:user][:password]
    private_key.private_decrypt(Base64.decode64(password))
  end

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
