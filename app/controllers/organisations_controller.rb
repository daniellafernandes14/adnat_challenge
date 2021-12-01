class OrganisationsController < ApplicationController

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    render 'create'
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    # redirect_to
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def show
    @organisation = Organisation.new
  end

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
