get '/user/:id/index' do
  user = User.find_by(id: params[:id])
  erb :'user/index', locals: {user: user, rentals: user.rentals}
end

get '/user/:id/edit' do
  user = User.find_by(id: params[:id])
  erb :'user/edit', locals: {user: user, rentals: user.rentals}
end

put '/user/:id/edit' do
  user = User.find_by(id: params[:id])
  params[:reason].keys.each do |id|
    rented_hero = user.rentals.find_by(superhero: id)
    rented_hero.update_attributes(reason: params[:reason][id])
  end

  redirect "/user/#{current_user.id}/index"
end


get '/user/:id/delete' do


end

delete '/user/:id/delete' do
  redirect "/user/#{current_user.id}/index"

end