class HomeController < ApplicationController
  def index
    api_call
    @coins = JSON.parse(@response)['data']
  end

  def about
  end

  def lookup
    api_call
    @lookup_coin = JSON.parse(@response)['data']
    @symbol = params[:sym]

    if @symbol
      @symbol = @symbol.upcase
    end

    if @symbol == ''
      @symbol = 'Please enter a currency symbol'
    end
  end

  private
    def api_call
      require 'net/http'
      require 'json'
      @url = 'https://api.coinmarketcap.com/v2/ticker/'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
    end
end
