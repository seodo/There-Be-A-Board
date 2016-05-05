class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @errors = @appointment.errors.full_messages
      render 'new'
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_time, :length, :notes, :phase, :status)
  end
end
