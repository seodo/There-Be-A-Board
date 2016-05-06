class Student < User
  has_many :appointments

  def can_book(appointment)
    !self.appointments.any?{
    |booking| (appointment.start_time >= booking.start_time && appointment.start_time < booking.end_time) || appointment.end_time > booking.start_time && appointment.end_time <= booking.end_time}
  end
end
