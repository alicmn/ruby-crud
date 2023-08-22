class StudentsController < ApplicationController
  def new
    @student = Student.new # create
  end

  def index
    @students = Student.all # Tüm öğrencileri al
  end

  # def show
  #   @student = Student.find(params[:id])
  # end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Öğrenci başarıyla eklendi.'
    else
      render :new
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path, notice: 'Öğrenci başarıyla silindi.'
  end

  def show
    @student = Student.find(params[:id])
  end
  def edit
    @student = Student.find(params[:id])
    # Düzenleme sayfasını görüntüle
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path, notice: 'Öğrenci başarıyla güncellendi.'
    else
      render :edit
    end
  end


  private
  def student_params
    params.require(:student).permit(:firstname,:lastname)
  end




end
