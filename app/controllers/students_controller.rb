class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = session[:last_student] if session[:last_student]
  end

  def create
    @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
    session[:last_student] = @student # setting the newly instantiated Student to session means that the data will persist across the webpage; params likely wouldn't
    redirect_to new_student_path # student_path(@student) # => this would redirect to the newly instantiated student's personal page
  end

end
