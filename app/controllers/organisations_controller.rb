class OrganisationsController < ApplicationController

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    redirect_to organisation_path(@organisation)
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

  def leave
    current_user.organisation_id = nil
    current_user.save
    redirect_to organisations_path
  end

  def join
    @organisation = Organisation.find(params[:id])
    current_user.organisation_id = @organisation.id
    current_user.save
    redirect_to organisation_path(@organisation)
  end

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
    current_user.organisation_id = @organisation.id
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    current_user.organisation_id = nil
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate, :id)
  end
end
