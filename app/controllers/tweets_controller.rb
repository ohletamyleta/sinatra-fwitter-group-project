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
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
  @user = Helpers.current_user(session)
  if @user.nil?
    redirect to '/login'
  else
    erb :'tweets/new'
  end
end

post '/tweets' do 
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
   
  @user = Helpers.current_user(session)
  if params[:content].empty?
    redirect to '/tweets/new'
  else
    @user.tweets.build({:content => params[:content], :user_id => params[:user_id]})
    @user.save
  end
  redirect to '/tweets'
end


# get '/tweets/:id' do

# end

# get '/tweets/:id/edit' do

# end

# patch '/tweets/:id' do

# end

# delete '/tweets/:id/delete' do

# end


end
