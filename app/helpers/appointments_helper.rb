module AppointmentsHelper

  def open_appointments
    Appointment.all.find_all{|a| a.open?}
  end

  def open_appts_where_phase_is(phase)
    open_appointments.find_all{|a| a.phase == phase.to_i}
  end
end
