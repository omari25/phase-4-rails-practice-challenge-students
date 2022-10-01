class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Student.all
    end

    def create
        
    end

    def update
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age)
    end

    def render_not_found_response
      render json: { error: "Student not found" }, status: :not_found
    end
end
