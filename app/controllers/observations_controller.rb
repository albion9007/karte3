class ObservationsController < ApplicationController
  before_action :set_patient, only: [:new, :create, :edit, :update]
  before_action :set_observation, only: [:edit, :update]
  
  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save  # バリデーションをクリアした時
      redirect_to patient_path(@patient)
    else
      render :new # バリデーションに弾かれた時
    end
  end

  def show
    observations = Observation.where(patient_id: params[:patient_id]).order(time: "DESC").to_a
    @observations = observations.sort_by{|o| o.time.delete(":").to_i}
  end

  def update
    if @observation.update(observation_params) # バリデーションをクリアした時
      redirect_to patient_observation_path(@observation)
    else
      render :edit  # バリデーションに弾かれた時
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:temperature, :pulse, :respiration, :high_blood_pressure, :low_blood_pressure, :spo2, :food_intake,
    :water_intake, :excresion, :ex_amount, :atten_sound, :atten_part, :sputum, :cough, :sleep, :time, :hainyou).merge(user_id: current_user.id, patient_id: params[:patient_id], user_name: current_user.name)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_observation
    @observation = Observation.find(params[:patient_id])
  end
end
