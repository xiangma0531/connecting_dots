class DotsController < ApplicationController
  def new
    @dot = Dot.new
  end

  def create
    @dot = Dot.new(dot_params)
    if @dot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @dot = Dot.find(params[:id])
  end

  private
  def dot_params
    params.require(:dot).permit(:title, :category, :introduction, :effort, :study, :acted_at).merge(student_id: current_student.id)
  end
end
