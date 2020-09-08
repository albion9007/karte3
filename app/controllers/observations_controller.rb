class ObservationsController < ApplicationController
  before_action :set_item, only: [:new, :create, :edit, :update, :show]
  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observation_params)
    if @observation.save  # バリデーションをクリアした時
      redirect_to patient_path(@patient)
    else
      render :new  # バリデーションに弾かれた時
    end
  end

  def update
    if @observation.update(item_params)  # バリデーションをクリアした時
      redirect_to patient_path(@patient)
    else
      render :edit  # バリデーションに弾かれた時
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:temperature, :pulse, :respiration, :high_blood_pressure, :low_blood_pressure, :spo2, :food_intake,
                                :water_intake, :excresion, :ex_amount, :atten_sound, :atten_part, :sputum, :cough, :sleep).merge(user_id: current_user.id, patient_id: params[:patient_id])
  end

  def set_item
    @patient=Patient.find(params[:patient_id])
  end
end
