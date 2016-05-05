module AppointmentsHelper


  def open_appointments
    Appointment.all.find_all{|a| a.open?}
  end

  def open_appts_where_phase_is(phase)
    phase ? open_appointments.find_all{|a| a.phase == phase.to_i} : open_appointments
  end

  def format_time_for_visibility(time)
    time.strftime("%A, %d %b %Y %l:%M %p")
  end
end
