class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def enroll
    @course = Course.find(params[:id])
    @course.enrollments.create(user: current_user)
    redirect_to @course, notice: "Successfully enrolled in course"
  end
end
