class AppointmentsController < ApplicationController
  include AppointmentsHelper

  def index
    @phase = params[:phase]
    @user = User.find_by(id: session[:user_id])
    @next_appointment = User.find_by(id: session[:user_id]).next_booked_appointment
    @phase = params[:phase]
    @appointments_by_phase = open_appts_where_phase_is(@phase)
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @topics = Topic.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id
    if params[:appointment][:topics]
      @appointment.topics << Topic.find(params[:appointment][:topics])
    end
      @appointment.start_time = combine_date_time(params[:date], params[:time])
    # @topics = Topic.all
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      @errors = @appointment.errors.full_messages
      render 'new'
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    if @appointment
      @appointment.start_time = format_time_for_visibility(@appointment.start_time)
    else
      redirect_to appointments_path
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.open?
      @appointment.assign_attributes(student_id: current_user.id)
      if @appointment.save
        redirect_to root_path
       else
        @errors = @appointment.errors.full_messages
      end
    else
      @errors = "This appointment was already booked."
    end
  end

  private

  def combine_date_time(date, time)
    dt = "#{date} #{time}"
    DateTime.parse(dt).utc.change(:offset => "-0400")
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :length, :notes, :phase, :status)
  end

end
