class StudentsController < ApplicationController
  def index
    @dots = Dot.all.order("acted_at DESC")
  end
end
