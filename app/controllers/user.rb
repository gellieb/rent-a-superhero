get '/user/:id/index' do
  user = User.find_by(id: params[:id])
  erb :'user/index', locals: {user: user, rentals: user.rentals}
end

get '/user/:id/edit' do
  erb :'user/edit'
end

delete '/user/:id/delete' do

end