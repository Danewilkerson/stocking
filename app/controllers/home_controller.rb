class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_d7da50553ce54dca9907e94af4f94f17')

    if params[:ticker] == ""
      @nothing = "Please enter a symbol"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
        @stock_logo = StockQuote::Stock.logo(params[:ticker])
      rescue RuntimeError
        @error = "Symbol does not exist. Please try again."
      else 
        p "No error"
      ensure 
        p "Done"
      end
    end
  end

  def about
  end

end
