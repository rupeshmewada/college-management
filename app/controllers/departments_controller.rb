class DepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    @department = Department.find(params[:id])
    render json: @department
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department, status: :created
    else
      render json: @department.errors
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors
    end
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
