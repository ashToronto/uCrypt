class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    crypto_api_call
    @coins = JSON.parse(@response)['data']
  end

  def about
  end

  def news
    news_api_call
    @news = JSON.parse(@response)['articles']
  end

  def lookup
    crypto_api_call
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
    def crypto_api_call
      require 'net/http'
      require 'json'
      @url = 'https://api.coinmarketcap.com/v2/ticker/'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
    end

    def news_api_call
      require 'net/http'
      require 'json'
      news_api_key = ENV["NEWS_KEY"]
      @url = "https://newsapi.org/v2/everything?q=cryptocurrency&q=blockchain&pageSize=100&
      from=today&sources=google-news,bbc-news,financial-post,mashable,reuters,techcrunch,
      the-wall-street-journal,time,wired,the-huffington-post,cbc-news,bloomberg,cnn,the-globe-and-mail,
      ars-technica,business-insider&sortBy=popularity&Language=en&apiKey=#{news_api_key}"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
    end
end
