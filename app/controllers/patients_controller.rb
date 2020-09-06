class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all.order("created_at DESC")
  end

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





# <% @items.each do |item|%>
#   <li class='list'>
#     <%= link_to item_path(item.id) do %>
#     <div class='item-img-content'>
#          <%= image_tag item.image, class:"item-img" %>
#       <%# 商品が売れていればsold outの表示 %>
#       <% if item.buy.present? %>
#       <div class='sold-out'>
#         <span>Sold Out!!</span>
#       </div>
#       <% end %>
#       <%# //商品が売れていればsold outの表示 %>
#     </div>
#     <div class='item-info'>
#       <h3 class='item-name'>
#         <%= item.item_name %>
#       </h3>
#       <div class='item-price'>
#         <span><%= item.price %>円<br>(税込み)</span>
#         <div class='star-btn'>
#           <%= image_tag "star.png", class:"star-icon" %>
#           <span class='star-count'>0</span>
#         </div>
#       </div>
#     </div>
#     <% end %>
#   </li>
#   <% end %>