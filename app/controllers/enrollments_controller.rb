class EnrollmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @enrollments = Enrollment.all
    render json: @enrollments
  end

  def show
    @enrollment = Enrollment.find(params[:id])
    render json: @enrollment
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment, status: :created
    else
      render json: @enrollment.errors
    end
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.update(enrollment_params)
      render json: @enrollment
    else
      render json: @enrollment.errors
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:enr_date, :student_id, :course_id)
  end
end
