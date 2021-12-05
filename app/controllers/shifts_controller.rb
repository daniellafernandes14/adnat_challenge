class ShiftsController < ApplicationController
  before_action :set_organisation, only: [:create, :index, :edit]
  before_action :set_shift, only: [:destroy, :edit, :update]

  def create
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    @shift.user.organisation = current_user.organisation
    @shift.save!
    redirect_to organisation_shifts_path(@organisation)
  end

  def index
    @shifts = Shift.all.order(start: :asc)
    @shift = Shift.new
  end

  def destroy
    shift.destroy
    redirect_to organisation_shifts_path
  end

  def edit
  end

  def update
    @shift.update(shift_params)
    redirect_to organisation_shifts_path
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def set_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length, :organisation_id)
  end
end
