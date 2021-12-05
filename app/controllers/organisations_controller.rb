class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:join, :update, :edit, :show, :destroy]

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    redirect_to organisation_path(@organisation)
    @organisation = Organisation.find(@organisation.id)
    current_user.organisation_id = @organisation.id
    current_user.save
  end

  def join
    current_user.organisation_id = @organisation.id
    current_user.save
    redirect_to organisation_path(@organisation)
  end

  def leave
    current_user.organisation_id = nil
    current_user.shifts.destroy_all
    current_user.save
    redirect_to organisations_path
  end

  def update
    @organisation.update(organisation_params)
    redirect_to organisations_path
  end

  def edit
  end

  def show
    current_user.organisation_id = @organisation.id
  end

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
    current_user.organisation_id = @organisation.id
  end

  def destroy
    @organisation.destroy
    current_user.organisation_id = nil
    redirect_to organisations_path
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate, :organisation_id)
  end
end
