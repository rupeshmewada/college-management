class FacultyController < ApplicationController
        skip_before_action :verify_authenticity_token
      
        def index
          @faculties = Faculty.all
          render json: @faculties
        end
      
        def show
          @faculty = Faculty.find(params[:id])
          render json: @faculty
        end
      
        def create
          @faculty = Faculty.new(faculty_params)
          if @faculty.save
            render json: @faculty, status: :created
          else
            render json: @faculty.errors
          end
        end
      
        def update
          @faculty = Faculty.find(params[:id])
          if @faculty.update(faculty_params)
            render json: @faculty
          else
            render json: @faculty.errors
          end
        end
      
        private
      
        def faculty_params
          params.require(:faculty).permit(:name,:address,:no,:department_id)
        end
      
end
