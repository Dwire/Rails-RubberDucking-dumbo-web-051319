class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @ducks = @student.ducks
  end

  def new
    @student = Student.new
  end
  
  def create
    @student = Student.create(student_params)
      if @student.valid?
        redirect_to student_path(@student)
      else
        # If we redirect save errors to FLASH_HASH
          flash[:errors] = @student.errors.full_messages
          redirect_to new_student_path

        # If we render save errors to instance variable
          # @errors = @student.errors.full_messages
          # render :new
      end
  end
  
  private 

  def student_params
    params.require(:student).permit(:name, :mod)
  end
  

end
