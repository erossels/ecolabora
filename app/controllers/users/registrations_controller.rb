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

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   products_path(resource)
  # end

  def after_update_path_for(resource)
    flash[:notice] = "Tus datos se han actualizado con éxito"
    user_profile_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
