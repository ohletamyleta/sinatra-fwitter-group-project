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


get '/tweets/:id' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/show_tweet'
end

get '/tweets/:id/edit' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/edit_tweet'

end

patch '/tweets/:id' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
  @user = Helpers.current_user(session)
  @tweet = Tweet.find(params[:id])

  if params[:tweet][:content].empty?
    redirect to "/tweets/#{@tweet.id}/edit"
  end

  @tweet.update(params[:tweet])
  @tweet.save
  redirect to "/tweets/#{@tweet.id}"
end

delete '/tweets/:id/delete' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
  @user = Helpers.current_user(session)
  @tweet = Tweet.find(params[:id])
  @tweet.delete
  redirect to '/tweets'
end


end
