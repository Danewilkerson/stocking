class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_d7da50553ce54dca9907e94af4f94f17')

    if params[:ticker] == ""
      @nothing = "Please enter a symbol"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
        @logo = StockQuote::Stock.logo(params[:ticker])
        @book = StockQuote::Stock.book(params[:ticker])
        @chart = StockQuote::Stock.chart(params[:ticker])
        @company = StockQuote::Stock.company(params[:ticker])
        @delayed_quote = StockQuote::Stock.delayed_quote(params[:ticker])
        @dividends = StockQuote::Stock.dividends(params[:ticker])
        @earnings = StockQuote::Stock.earnings(params[:ticker])
        @financials = StockQuote::Stock.financials(params[:ticker])
        @stats = StockQuote::Stock.stats(params[:ticker])
        @news = StockQuote::Stock.news(params[:ticker])
        @ohlc = StockQuote::Stock.ohlc(params[:ticker])
        @peers = StockQuote::Stock.peers(params[:ticker])
        @previous = StockQuote::Stock.previous(params[:ticker])
        @price = StockQuote::Stock.price(params[:ticker])
        @quote = StockQuote::Stock.quote(params[:ticker])
        @relevant = StockQuote::Stock.relevant(params[:ticker])
        @splits = StockQuote::Stock.splits(params[:ticker])
        @volume_by_venue = StockQuote::Stock.volume_by_venue(params[:ticker])
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
