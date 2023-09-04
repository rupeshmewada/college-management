class FacultiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @department = Department.find(params[:department_id])
    @faculties = @department.faculties.all
    render json: @faculties
  end

  def show
    @department = Department.find(params[:department_id])
    @faculty = @department.faculties.find(params[:id])
    render json: @faculty
  end

  def create
    @department = Department.find(params[:department_id])
    @faculty = @department.faculties.new(faculty_params)

    if @faculty.save
      render json: @faculty, status: :created
    else
      render json: @faculty.errors
    end
  end

  def update
    @department = Department.find(params[:department_id])
    @faculty = @department.faculties.find(params[:id])
    if @faculty.update(faculty_params)
      render json: @faculty 
    else
      render json: @faculty.errors
    end
  end

  private

  def faculty_params
    params.require(:faculty).permit(:name, :address, :no, :department_id)
  end
end
