class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :author_id

  validates :full_name, :email, presence: true

  def past_appointments
    self.appointments.find_all{|appt| appt.past?}.sort{|a,b| a.start_time <=> b.start_time}
  end

  def reviewed_past_appointments
    self.appointments.find_all{
      |appt|!!appt.reviews.find{|review| review.author_id == self.id}}
      .sort{|a,b| a.start_time <=> b.start_time}
  end

  def unreviewed_past_appointments
    self.past_appointments - self.reviewed_past_appointments
  end

  def future_appointments
    self.appointments.find_all{|appt| !appt.past?}.sort{|a,b| a.start_time <=> b.start_time}
  end

  def booked_appointments
    self.future_appointments.find_all{|appt| appt.booked?}
  end

  def next_booked_appointment
    self.booked_appointments.first
  end

  def open_appointments
    self.future_appointments.find_all{|appt| appt.open?}
  end

  def unbooked_past_appointments
    self.past_appointments.find_all{|appt| appt.open?}
  end

  def received_reviews
    self.past_appointments.map {|appt| appt.reviews.find{|rev| rev.author_id != self.id}}.compact
  end

  def average_rating
    unless self.received_reviews.empty?
      self.received_reviews.reduce(0){|sum, rev| sum + rev.rating.to_i} / self.received_reviews.length
    else
      "no reviews yet"
    end
  end

  def stars_received
    self.received_reviews.reduce(0){|sum, rev| sum + rev.rating.to_i}
  end

  def karma
    self.stars_received + self.reviews.count
  end

    def can_book(appointment)
    type == "Student" && !self.appointments.any?{ |booking| (appointment.start_time >= booking.start_time && appointment.start_time < booking.end_time) || appointment.end_time > booking.start_time && appointment.end_time <= booking.end_time}
  end

  def has_not_reviewed(appt)
    appt.reviews.none?{|review| review.author_id == self.id}
  end
end
