class StaticPagesController < ApplicationController
  def home
  	@value_inquiry = current_user.value_inquiry.build if signed_in?
  	@karat_list = {'24 Karat' => '24' , 
                   '23 Karat' => '23' , 
                   '22 Karat' => '22' , 
                   '21 Karat' => '21' , 
                   '20 Karat' => '20' , 
                   '19 Karat' => '19' , 
                   '18 Karat' => '18' , 
                   '16 Karat' => '16' , 
                   '14 Karat' => '14' , 
                   '12 Karat' => '12' , 
                   '10 Karat' => '10' }

#     response = HTTParty.get(http://www.quandl.com/api/v1/datasets/BUNDESBANK/BBK01_WT5511.json?trim_start=2014-01-01&trim_end=2014-02-02)

      response = HTTParty.get("http://www.quandl.com/WGC/GOLD_DAILY_USD.json?trim_start=2014-01-01")
#      params = {"trim_start" => "2014-01-02"}
      body = JSON.parse(response.body)
      @data = body["data"]
      h1 = Hash[*@data.flatten]
#      k = Time.now.strftime("%Y-%m-%d") #'2014-01-08'
      @latest_price = h1.values[0]
      @latest_date = h1.keys[0]
      @troy_ounce = 31.1
      @pure_gram_price  = @latest_price/@troy_ounce

      puts '**************GOLD API'
#      puts k
#      puts h1[k]
      puts @latest_price
      puts @troy_ounce
      puts @pure_gram_price
#      puts Time.now.strftime("%Y-%m-%d")
      puts '**GOLD API***************'
  end

  def create
  end

  def help
  end

  def about
  end

  def contact
  end

end