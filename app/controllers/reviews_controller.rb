class ReviewsController < ApplicationController

  def new
    if !logged_in?
      redirect_to root_path
    else
      @appointment = Appointment.find(params[:appointment_id])
      @review = Review.new
    end
  end

  def create
  @review = Review.new(review_params.merge(author_id: current_user.id, appointment_id: params[:appointment_id]))

    if @review.save
      redirect_to appointment_path(Appointment.find(params[:appointment_id]))
    else
      redirect_to new_appointment_review_path(Appointment.find(params[:appointment_id]))
    end

  end

  # def show
  #   @reviews = User.received_reviews
  # end

   private
  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
