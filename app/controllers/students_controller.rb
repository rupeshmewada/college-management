class StudentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def new
    @stu_new = Student.new
    render json: @stu_new
  end

  def create
    @stu_cre = Student.new(stu_params)
    if @stu_cre.save
      render json: @stu_cre, status: :created
    else
      render json: @stu_cre.errors
    end
  end

  def update
    @stu_up = Student.find(params[:id])
    if @stu_up.update(stu_params)
      render json: @stu_up
    else
      render json: @stu_up.errors
    end
  end

  def destroy
    @stu = Student.find(params[:id])
    @stu.destroy
    render json: "delete succsess "
  end

  private

  def stu_params
    params.require(:student).permit(:name, :dob, :address, :no, :email)
  end
end
