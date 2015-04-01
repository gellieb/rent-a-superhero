get '/superhero/index' do
  erb :'superhero/index', locals: {heros: Superhero.all} #.order('overall_rating')}
end

get '/superhero/:id' do
  erb :'superhero/show', locals: {hero: Superhero.find_by(id: params[:id])}
end