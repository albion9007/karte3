class PatientsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all.order('created_at DESC')
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      PatientUser.create(user_id: current_user.id, patient_id: @patient.id)
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

  def set_item
    @patient = Patient.find(params[:id])
  end
end
