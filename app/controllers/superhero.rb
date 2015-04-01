get '/superhero/index' do
  erb :'superhero/index', locals: {heros: Superhero.all} #.order('overall_rating')}
end