# GET /superheroes
get '/superhero/index' do
  @heroes = Superhero.all
  # To me, sgh, I feel like this is less typing and more clear.  While there are advantages to using locals, Angel, I would like to suggest that those advantages are best expressed within the context of a view.  Please look at this template and we will see a practical implication.
  erb :'superhero/index'
end

# GET /superheroes/new
get '/superhero/new' do
  erb :'superhero/new'
end

# POST /superheroes
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

# OK
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

# POST /rentals.  Let's imagine this route were on a, to the moment,
# non-existent rentals controller.  If that thing existed I think this could be
# better written as:
#
#
# post '/rentals' do
#   Rental.create(user: current_user, superhero: Superhero.find(params[:id]), reason: params[:reason])
#   redirect "/user/#{current_user.id}/index"
# end

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


