class ReviewsController < ApplicationController

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def create
  @review = Review.new(review_params.merge(author_id: current_user.id, appointment_id: params[:appointment_id]))

    if @review.save
      redirect_to appointment_path(Appointment.find(params[:appointment_id]))
    else
      redirect_to new_appointment_review_path(Appointment.find(params[:appointment_id]))
    end

  end

   private
  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
