class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :author_id

  validates :full_name, :email, presence: true

  def completed_appointments
    self.appointments.find_all{|appt| appt.complete?}
  end

  def reviewed_appointments
    self.appointments.find_all do |appt|
      !!appt.reviews.find{|review| review.author_id == self.id}
    end
  end

  def unreviewed_appointments
    self.completed_appointments - self.reviewed_appointments
  end

  def future_appointments
    self.appointments.find_all{|appt| !appt.complete?}
  end

  def booked_appointments
    self.future_appointments.find_all{|appt| appt.booked?}
  end

  def open_appointments
    self.future_appointments.find_all{|appt| appt.open?}
  end

  def unbooked_past_appointments
    self.completed_appointments.find_all{|appt| appt.open?}
  end

  def received_reviews
    self.completed_appointments.map do |appt|
      appt.reviews.find{|rev| rev.author_id != self.id}
    end
  end

  def average_rating
    self.received_reviews.reduce(0){|sum, rev| sum + rev.rating.to_i} / self.received_reviews.length
  end
end
