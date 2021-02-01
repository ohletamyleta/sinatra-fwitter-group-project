class UsersController < ApplicationController


  get '/' do
    erb :index, create_user => :'tweets/tweets'
  end


get '/signup' do
  if Helpers.is_logged_in?(session)
    redirect to '/tweets'
  end
  erb :'users/create_user'
end

post '/signup' do
  @user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])
  #binding.pry
  if @user.username !="" && @user.username !=nil && @user.password !="" && @user.password != nil && @user.email !="" && @user.email != nil
    session[:user_id] = user.id
    @user.save
          redirect "/tweets"
      else
          redirect "/signup"
      end
erb :'tweets/tweets'

end


get '/tweets' do
  if !Helpers.is_logged_in?(session)
    redirect to '/login'
  end
  @tweets = Tweet.all
  @user = Helpers.current_user(session)
  erb :'tweets/tweets'
end

get '/login' do

end

post '/login' do

end

  #   user = User.find_by(:username => params[:username])
	# 	if user && user.authenticate(params[:password])
	# 		session[:user_id] = user.id
	# 		redirect"/tweets"
	# 	else
	# 		redirect "/failure"
	# 	end
  # end



end
