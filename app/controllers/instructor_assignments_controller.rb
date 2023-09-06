class InstructorAssignmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @instructors = InstructorAssignment.all
    render json: @instructors
  end

  def show
    @inst = InstructorAssignment.find(params[:id])
    render json: @inst
  end

  def create
    @inst = InstructorAssignment.new(inst_params)
    if @inst.save
      render json: @inst, status: :created
    else
      render json: @inst.errors
    end
  end

  def update
    @inst = InstructorAssignment.find(params[:id])
    puts "update action  "

    if @inst.update(inst_params)
      puts "#{@inst.enr_date}"
      render json: @inst
    else
      puts "#{@inst.enr_date}"
      render json: @inst.errors
    end
  end

  def destroy
    @stu = InstructorAssignment.find(params[:id])
    @stu.destroy
    render json: "delete succsess "
  end

  private

  def inst_params
    params.require(:instructor_assignment).permit(:faculty_id, :course_id)
  end
end
