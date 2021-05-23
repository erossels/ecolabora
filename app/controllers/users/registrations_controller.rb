# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @counties = County.all
    @regions = Region.all
    super


  end

  # POST /resource
  def create
    @counties = County.all
    @regions = Region.all
    super
  end

  # GET /resource/edit
  def edit
    @counties = County.all
    @regions = Region.all
    super
  end

  # PUT /resource
  def update
    if current_user.provider == "facebook"
      account_update_params.delete("current_password")
      current_user.update_without_password(account_update_params)
    else
      current_user.update_with_password(account_update_params)
    end

    @counties = County.all
    @regions = Region.all
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :address, :n_address, :city, :province, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :address, :n_address, :city, :province, :avatar])
  end

  def after_update_path_for(resource)
    flash[:notice] = "Tus datos se han actualizado con éxito"
    user_profile_path
  end

end
