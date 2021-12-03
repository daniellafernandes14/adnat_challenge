class ShiftsController < ApplicationController
  def create
    @shift = Shift.new(shift_params)
    @organisation = Organisation.find(params[:organisation_id])
    @shift.user_id = current_user
    if @shift.save
      redirect_to organisation_shifts_path(@organisation)
    else
      render :new
    end
  end

  def new
  end

  def index
    @shifts = Shift.all
    @shift = Shift.new
    @organisation = Organisation.find(params[:organisation_id])
  end

  private

  def shift_params
    params.require(:shift).permit(:start, :finish, :break_length)
  end
end
