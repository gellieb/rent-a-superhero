get '/superhero/index' do
  erb :'superhero/index', locals: {heros: Superhero.all} #.order('overall_rating')}
end

get '/superhero/new' do
  erb :'superhero/new'
end

post '/superhero/new' do
  if Superhero.find_by(name: params[:name])
    erb :'superhero/error'
  else
    hero = Superhero.create(name: params[:name],
      specialty: params[:specialty],
      bio: params[:bio])
    redirect '/superhero/index'
  end

end

get '/superhero/:id' do
  if request.xhr?
    erb :'superhero/show', locals: {hero: Superhero.find_by(id: params[:id])}, layout: false
  else
    erb :'superhero/show', locals: {hero: Superhero.find_by(id: params[:id])}
  end
end

get '/superhero/:id/rent' do
  hero= Superhero.find_by(id: params[:id])

  erb :'rental/new', locals: {hero: hero}
end

post '/superhero/:id/rent' do
  hero= Superhero.find(params[:id])
  rental = Rental.create(user: current_user,
    superhero: hero,
    reason: params[:reason])
  redirect "/user/#{current_user.id}/index"
end


# put '/superhero/:id/rent' do
#   hero= Superhero.find_by(id: params[:id])
#   # Rental.create(user: current_user,
#   #               superhero: hero,
#   #               reason:
#   #               )
#   # if current_user
#   #   current_user.rentals <<


#   end

# end


