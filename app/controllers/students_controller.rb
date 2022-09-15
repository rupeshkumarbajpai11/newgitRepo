class StudentsController < ApplicationController
  require 'csv'
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  #GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new

  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    begin
      file=(params[:student][:csv_file])
      f=file.content_type
      rescue Exception =>e
        # flash[:notice] = "File not found"
         flash[:notice] = e
         
    end  
      if f== "text/csv"

        Student.func(params[:student][:csv_file])
        redirect_to students_path
      else 
        
        redirect_to students_path

      end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :phone_number, :csv_file,:studentID)
    end
end
