class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  # def index
  # end
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def patient_params
  params.require(:patient).permit(:p_num, :image, :name, :birth_date, :post_num, :prefecture_id, :city,
                                :house_num, :apart_name, :tel, :key_person, :kp_tel, :main_disease, :sub_disease, :main_doctor).merge(user_id: current_user.id)
  end
end




# def index
#   @kartes = Karte.includes(:user).order("created_at DESC")
# end