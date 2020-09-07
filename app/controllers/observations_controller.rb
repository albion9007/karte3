class ObservationsController < ApplicationController
  def new
    @observation = Observation.new
  end

  def edit
  end

  def update
    if @Observation.update(item_params)  # バリデーションをクリアした時
      redirect_to root_path
    else
      render :edit  # バリデーションに弾かれた時
    end
  end
end
