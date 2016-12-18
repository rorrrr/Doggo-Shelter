require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/owner.rb' )

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
