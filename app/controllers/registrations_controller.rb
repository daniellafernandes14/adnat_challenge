class RegistrationsController < ApplicationController
  def update
    # params[:user].delete(:password) if params[:user][:password].blank?
    # params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
    current_user.organisation = Organisation.all.first
    current_user.save!
    redirect_to organisation_path(current_user.organisation)
  end
end
