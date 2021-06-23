class StudentsController < ApplicationController
  before_action :authenticate_student!, except: :index

  def index
    if student_signed_in?
      @dots = current_student.dots.order("acted_at DESC")
    end
  end
end
