class CoursesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @department = Department.find(params[:department_id])
    @courses = @department.courses.all
    render json: @courses
  end

  def show
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:id])
    render json: @course
  end

  def create
    # debugger
    puts "before dep"
    @department = Department.find(params[:department_id])
    puts "in dep"
    @course = @department.courses.new(course_params)
    puts "after dep"
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors 
    end
  end

  def update
    @department = Department.find(params[:department_id])
    @course = @department.courses.find(params[:id])
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
