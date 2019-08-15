class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
    #pass and instance variable instead of writing Student.all in the collection_select (MVC!!)
    @students = Student.all
  end

  def create
    @duck = Duck.create(duck_params)

    if @duck.valid?
      redirect_to @duck
    else 
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end 
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    @duck = Duck.find(params[:id])
    
    # update errors are the same as create but .update returns a boolean so we don't need .valid? or .save in our if statment
    if @duck.update(duck_params)
      redirect_to @duck
    else 
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path(@duck)
    end 
  end 

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end
  
end
