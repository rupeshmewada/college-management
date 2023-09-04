class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    puts "before dep"
    @department = Department.find(params[:department_id])
    puts "after dep"
    @courses = @department.course
    render json: @courses
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :department_id)
  end
end
