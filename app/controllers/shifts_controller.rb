class ShiftsController < ApplicationController
  def create
    @organisation = Organisation.find(params[:organisation_id])
    @shift = Shift.new(shift_params)
    @shift.user_id = current_user.id
    @shift.user.organisation = current_user.organisation
    @shift.save!
    redirect_to organisation_shifts_path(@organisation)
  end

  def new
  end

  def index
    @shifts = Shift.all.order(start: :asc)
    @shift = Shift.new
    @organisation = Organisation.find(params[:organisation_id])
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length, :organisation_id)
  end
end
