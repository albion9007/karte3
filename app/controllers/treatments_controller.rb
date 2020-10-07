class TreatmentsController < ApplicationController
  before_action :set_patient, only: [:create_new_treatment_data, :new, :treat_partial_update, :create, :delete, :show]
  before_action :set_treatment, only: [:treat_partial_update, :delete]
  protect_from_forgery except: [:create_new_treatment_data, :treat_partial_update, :delete]

  def new
    @treatment = Treatment.new
    treatments = Treatment.where(patient_id: params[:patient_id]).to_a
    @treatments = treatments.sort_by { |t| t.time.delete(':').to_i }
  end

  def create
    @treatment = Treatment.new(treatment_params)
    if @treatment.save # バリデーションをクリアした時
      redirect_to new_patient_treatment_path(@patient)
    else
      render :new # バリデーションに弾かれた時
    end
  end

  def show
    treatments = Treatment.where(patient_id: params[:patient_id]).to_a
    @treatments = treatments.sort_by { |t| t.time.delete(':').to_i }
  end
  
  def create_new_treatment_data
    @treatment = Treatment.new({user_id: current_user.id, patient_id: params[:patient_id],
      user_name: current_user.name, time: params[:time]})
    if @treatment.invalid?
      render status: 400, json: {
        message: @treatment.errors.full_messages[0]
      }
    else
      @treatment.save
    end
  end

  def treat_partial_update
    if params[:col] == 'test'
      @treatment.test = params[:value]
    elsif params[:col] == 'medicine'
      @treatment.medicine = params[:value]
    elsif params[:col] == 'injection'
      @treatment.injection = params[:value]
    end
    @treatment.save
    treatments = Treatment.where(patient_id: params[:patient_id]).to_a
    @treatments = treatments.sort_by { |t| t.time.delete(':').to_i }
  end

  def delete
    @treatment.destroy
  end
  
  private

  def treatment_params
    params.require(:treatment).permit(:time, :test, :medicine, :injection).merge(user_id: current_user.id, patient_id: params[:patient_id], user_name: current_user.name)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

end
