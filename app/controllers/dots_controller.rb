class DotsController < ApplicationController
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :set_dot, only: [:show, :edit, :update]

  def new
    @dot = Dot.new
  end

  def create
    @dot = Dot.new(dot_params)
    if @dot.valid?
      @dot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dot.update(dot_params)
      redirect_to dot_path(@dot.id)
    else
      render :edit
    end
  end

  def destroy
    dot = Dot.find(params[:id])
    dot.destroy
    redirect_to root_path
  end

  private
  def dot_params
    params.require(:dot).permit(:title, :category_id, :introduction, :effort, :study, :acted_at).merge(student_id: current_student.id)
  end

  def set_dot
    @dot = Dot.find(params[:id])
  end

  def move_to_index
    dot = Dot.find(params[:id])
    unless dot.student_id == current_student.id
      redirect_to root_path
    end
  end
end
