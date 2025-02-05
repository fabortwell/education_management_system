class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Your course listing logic here
  end
end
