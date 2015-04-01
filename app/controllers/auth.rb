get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end

put '/login' do
  current_user = User.find_by(email: params[:email])
  if current_user
    session[:user_id] = current_user.id
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params)
  if new_user.save!
    redirect '/login'
  else
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
