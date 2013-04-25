enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/verify' do
  @user = User.authenticate(params) 

  if @user == nil
    erb :user_not_found
  else
    session[:logged_in] = true
    erb :verify 
  end
end    

get '/create' do
  erb :create_account
end

post '/create' do
  puts params
  User.create(params)
  redirect to '/'
end

get '/logout' do
  session[:logged_in] = false
  redirect to '/'
end

get '/vip' do
  if session[:logged_in] == true
    erb :vip
  else
    erb :index
  end
end
