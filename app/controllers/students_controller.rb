class StudentsController < ApplicationController
  def index
    @dots = current_student.dots.order("acted_at DESC")
  end
end
