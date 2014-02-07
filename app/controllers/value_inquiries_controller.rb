class ValueInquiriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :update, :destroy]
  
  def index
  end
    
  def create
    @pure_gram_karat = 24
    @troy_ounce = 31.1
    @karat = params[:value_inquiry][:karat].to_f
    @weight = params[:value_inquiry][:weight].to_f
    @market_price = params[:value_inquiry][:market_price].to_f

    @gold_value = ((@karat / @pure_gram_karat) * (@market_price / @troy_ounce) * @weight).round(2)

#    binding.pry
    # this is to assign a calculated number to the value field
#    value_inquiry_params[:value] = @gold_value # assignment wont work
#    @value_inquiry = current_user.value_inquiry.build(params[:value_inquiry])
      puts 'ValueInquiriesController *******************'
      puts params[:value_inquiry]
      puts @karat
      puts @weight
      puts @market_price
      puts "GoldValue: #{@gold_value}"
      puts '******************* ValueInquiriesController'

#      @value_inquiry = current_user.value_inquiry.build(value_inquiry_params)
    @value_inquiry = current_user.value_inquiry.new(:karat => @karat, :weight => @weight, :market_price => @market_price, :value => @gold_value)


    if @value_inquiry.save
      flash[:success] = "Your gold is valued at $" + @value_inquiry.value.to_s+ ". Your Inquiry has been saved!"

      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end


  def value_inquiry_params
#    @value = (params[][:karat]/value_inquiry_params[:pure_gram_karat])*@puregram
    params.require(:value_inquiry).permit(:karat, :weight, :market_price)
#    value_inquiry_params.update(:value)
  end

end