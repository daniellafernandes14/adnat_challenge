class OrganisationsController < ApplicationController

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    redirect_to organisations_path
    # @organisation = Organisation.find(@organisation_id)
    @organisation = current_user.organisation_id
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to organisations_path
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def show
    @organisation = Organisation.find(params[:id])
    current_user.organisation_id = @organisation.id
  end

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    current_user.organisation_id = nil
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
