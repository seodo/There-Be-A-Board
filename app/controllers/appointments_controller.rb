class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @topics = Topic.all
  end

  def create
    # binding.pry
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id
    @appointment.topics << Topic.find(params[:appointment][:topics])
    @appointment.start_time = combine_date_time(params[:date], params[:time])
    @topics = Topic.all
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

  # def update
  #   @appointment = Appointment.find_by(id: params[:id])
  #   @appointment.assign_attributes(student_id: current_user.id)
  #   if @appointment.save
  #
  #
  #   else
  #      @errors = @appointment.errors.full_messages
  #   end
  # end

  private

  def combine_date_time(date, time)
    dt = "#{date} #{time} +0400"
    DateTime.parse(dt)
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :length, :notes, :phase, :status)
  end

end
