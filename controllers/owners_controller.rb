require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb')
require_relative( '../controllers/animals_controller.rb')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

post '/owners' do
  @owner = Owner.new( params )
  @owner.save()
  erb(:"owners/create")
end

get '/owners/new' do
  erb(:"owners/new")
end

get '/owners/:id' do
  id = params[:id]
  @owner = Owner.find(id)
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.update(params)
  redirect to "/owners/#{ params[:id] }"
end

post '/owners/:id/delete' do
  Owner.destroy( params[:id] )
  redirect to('/owners')
end

get '/owners/:id/:match_number' do
  @owner = Owner.find( params[:id] )
  @animal_match = @owner.matches()[params[:match_number].to_i]
  if @animal_match == nil
    return erb(:"owners/nomatches")
  end
  erb(:"owners/matches")
end
