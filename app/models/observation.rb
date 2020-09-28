class Observation < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :patient, optional: true
  # バリデーションをカスタマイズする。このバリデーションは1日の中での最大数のチェック。
  validate :max_times_in_one_day
  validate :exists_time

  # 定数を定義しておく。（24と言う数字に対して意味をつけ分かりやすくする。
  MAX_TIMES_IN_ONE_DAY = 24

  # カスタムバリデーションメソッドで1日の中での最大数を超えていたらエラーを設定する。
  def max_times_in_one_day
    # データベースを検索して患者の1日の中の時間の数をカウントして最大数を超えているかチェックする。
    if Observation.where(patient_id: patient_id, date: date).count >= MAX_TIMES_IN_ONE_DAY
      # 1日の中の最大数を超えていた場合エラーを設定する。
      errors.add(:time, "1日に" + MAX_TIMES_IN_ONE_DAY.to_s + "項目以上は設定できません")
    end
  end

  def exists_time
    if Observation.where(date: date, time: time).count > 0
      # :timeはどの項目でエラーが起きているか確認。
      errors.add(:time, time + "は既に存在しています")
    end
  end
end
