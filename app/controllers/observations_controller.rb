class ObservationsController < ApplicationController
  before_action :set_patient, only: [:new, :create, :edit, :update, :show]
  before_action :set_observation, only: [:edit, :update, :show]
  
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
                                        :water_intake, :excresion, :ex_amount, :atten_sound, :atten_part, :sputum, :cough, :sleep).merge(user_id: current_user.id, patient_id: params[:patient_id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_observation
    @observation = Observation.find(params[:patient_id])
  end
end
