class Appointment < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  belongs_to :student, class_name: 'User'
  has_many :reviews
  has_and_belongs_to_many :topics

  validates :start_time, :length, :phase, presence: true
  validate :cannot_end_before_it_starts, :cannot_start_in_the_past, :cannot_overlap_existing_user_appointment

def end_time
  start_time + length.to_i.minutes
end

def open?
  !student_id && !self.past?
end

def booked?
  !self.open?
end

def past?
  self.end_time < DateTime.now
end

private

def cannot_end_before_it_starts
  if start_time - self.end_time > 0
    errors.add(:end_time, "cannot be before the start time.")
  end
end

def cannot_start_in_the_past
  if start_time < DateTime.now
    errors.add(:start_time, "cannot be in the past.")
  end
end

def cannot_overlap_existing_user_appointment
  potential_conflicts = User.find(student_id || mentor_id).appointments
  if potential_conflicts.any?{
    |appt| start_time >= appt.start_time && start_time < appt.end_time }
    errors.add(:start_time, "overlaps with one of your existing commitments.")
  elsif potential_conflicts.any?{ |appt| self.end_time > appt.start_time && self.end_time <= appt.end_time}
      errors.add(:end_time, "overlaps with one of your existing commitments.")
  end
end

end
