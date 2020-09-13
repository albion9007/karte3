class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
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

  def update
    if @patient.update(patient_params)
      redirect_to patient_path
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      redirect_to root_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:p_num, :image, :name, :birth_date, :post_num, :prefecture_id, :city,
                                    :house_num, :apart_name, :tel, :key_person, :kp_tel, :main_disease, :sub_disease, :main_doctor).merge(user_id: current_user.id)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
