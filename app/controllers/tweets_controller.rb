require 'pry'
class TweetsController < ApplicationController

  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @tweets = Tweet.where(user_id: @user.id)
      #binding.pry
      erb :'/tweets/tweets'
    else
      redirect to '/users/login'
    end
  end

  get '/tweets/new' do
    if Helpers.is_logged_in?(session)
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  post '/tweets' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      tweet = Tweet.new(content: params[:content])
      #binding.pry
      tweet.user = @user
      tweet.save
      redirect '/tweets'
    else
      redirect '/login'
    end
  end


end
