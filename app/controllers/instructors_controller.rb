class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Instructor.all
    end

    def create
        render json: Instructor.create!(instructor_params), status: :created
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def render_not_found_response
      render json: { error: "Instructor not found" }, status: :not_found
    end


end
