class TweetsController < ApplicationController



  get '/tweets' do
    if Helpers.is_logged_in?(session)
      @tweets = Tweet.all
     erb :'tweets/tweets'
    else
  redirect to '/login'
  end
  end

get '/tweets/new' do
  @user = Helpers.current_user(session)
  if @user.nil?
    redirect to '/login'
  else
    erb :'tweets/new'
  end
end

# post '/tweets' do 

# end 

# get '/tweets/:id' do

# end

# get '/tweets/:id/edit' do

# end

# patch '/tweets/:id' do

# end

# delete '/tweets/:id/delete' do

# end


end
