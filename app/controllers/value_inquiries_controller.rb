class ValueInquiriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :update, :destroy]

  def index
  end

  def create
    @pure_gram_karat = 24
    @troy_ounce = 31.1

      params[:value_inquiry][:value] = ((value_inquiry_params[:karat].to_f / @pure_gram_karat) * (value_inquiry_params[:market_price].to_f / @troy_ounce) * value_inquiry_params[:weight].to_f)
      puts 'ValueInquiriesController *******************'
      puts value_inquiry_params
      puts value_inquiry_params[:karat].to_f
      puts value_inquiry_params[:weight].to_f
      puts value_inquiry_params[:market_price].to_f
      puts value_inquiry_params[:value].to_f
      puts (value_inquiry_params[:karat].to_f / @pure_gram_karat) * (value_inquiry_params[:market_price].to_f / @troy_ounce)
      puts (value_inquiry_params[:karat].to_f / @pure_gram_karat)
      puts (value_inquiry_params[:market_price].to_f/@troy_ounce)
      puts '******************* ValueInquiriesController'
      @value_inquiry = current_user.value_inquiry.build(value_inquiry_params)
    if @value_inquiry.save
      flash[:success] = "Your gold is valued at $" + value_inquiry_params[:value] + ". Your Inquiry has been saved!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end


  def value_inquiry_params
#    @value = (params[][:karat]/value_inquiry_params[:pure_gram_karat])*@puregram
    params.require(:value_inquiry).permit(:karat, :weight, :market_price, :value)
  end

end