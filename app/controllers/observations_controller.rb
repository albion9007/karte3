class ObservationsController < ApplicationController
  before_action :set_patient, only: [:new, :create, :edit, :update, :partial_update]
  before_action :set_observation, only: [:edit, :update, :partial_update]
  # railsのデフォルトCSRF対策を外す
  protect_from_forgery :except => [:partial_update]

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
    observations = Observation.where(patient_id: params[:patient_id]).to_a
    @observations = observations.sort_by { |o| o.time.delete(':').to_i }
    @data = @observations.map do |o|
      [o.time, o.temperature] if o.temperature.present?
    end
    @data2 = @observations.map do |o|
      [o.time, o.pulse] if o.pulse.present?
    end
    @data3 = @observations.map do |o|
      [o.time, o.respiration] if o.respiration.present?
    end
    @data4 = @observations.map do |o|
      [o.time, o.high_blood_pressure] if o.high_blood_pressure.present?
    end
    @data5 = @observations.map do |o|
      [o.time, o.low_blood_pressure] if o.low_blood_pressure.present?
    end
  end

  def edit
    @patient = Patient.find(patient_id: params[:patient_id])
    @observation = Observation.find(observation: params[:observation_id])
    # observations = Observation.where(patient_id: params[:patient_id]).to_a
  end

  def update
    if @observation.update(observation_params) # バリデーションをクリアした時
      redirect_to patient_observation_path(@observation)
    else
      render :edit # バリデーションに弾かれた時
    end
  end
# ajaxから呼び出されるためのアクションを設定する
  def partial_update
    # dataを初期化
    data = []
    # ajaxで指定されたカラムを更新する
    # colで指定されたカラムをvalueで指定された値に更新する
    if params[:col] == 'temperature'
      @observation.temperature = params[:value]
    elsif params[:col] == 'pulse'
      @observation.pulse = params[:value]
    elsif params[:col] == 'respiration'
      @observation.respiration = params[:value]
    elsif params[:col] == 'high_blood_pressure'
      @observation.high_blood_pressure = params[:value]
    elsif params[:col] == 'low_blood_pressure'
      @observation.low_blood_pressure = params[:value]
    elsif params[:col] == 'spo2'
      @observation.spo2 = params[:value]
    elsif params[:col] == 'food_intake'
      @observation.food_intake = params[:value]
    elsif params[:col] == 'water_intake'
      @observation.water_intake = params[:value]
    elsif params[:col] == 'sleep'
      @observation.sleep = params[:value]
    end
    @observation.save
    # データ更新後のObservationを取得
    observations = Observation.where(patient_id: params[:patient_id]).to_a
    # 時間を整数として、数字が若い順で並べている
    @observations = observations.sort_by { |o| o.time.delete(':').to_i }
    # もしtemperatureが指定されたらdataと言う変数に、最新のtemperatureのデータを格納する処理
    if params[:col] == 'temperature'
      data = @observations.map do |o|
        # 時間が有っても体温の入力が無い場合は無視される（if o.temperature.present?）
        [o.time, o.temperature] if o.temperature.present?
      end
      name = '体温'
    end

    if params[:col] == 'pulse'
      data = @observations.map do |o|
        [o.time, o.pulse] if o.pulse.present?
      end
      name = '脈拍'
    end

    if params[:col] == 'respiration'
      data = @observations.map do |o|
        [o.time, o.respiration] if o.respiration.present?
      end
      name = '呼吸数'
    end
    render json: { result: 'SUCCESS', chart_data: data.compact  }
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
    # @observation = Observation.find(params[:patient_id])
    @observation = Observation.find(params[:id])
  end
end
