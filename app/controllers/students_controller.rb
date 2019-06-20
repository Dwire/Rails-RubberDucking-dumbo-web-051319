class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)

    if student.valid?
      redirect_to student_path(student)
    else
      flash[:errors] = student.errors.full_messages
      flash[:note] = "fun note to user"
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
