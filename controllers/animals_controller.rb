require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

post '/animals' do
  @animal = Animal.new( params )
  @animal.save()
  erb(:"animals/create")
end

get '/animals/new' do
  erb(:"animals/new")
end

get '/animals/:id' do
  id = params[:id]
  @animal = Animal.find(id)
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animals/:id' do
  Animal.update(params)
  redirect to "/animals/#{ params[:id] }"
end

post '/animals/:id/delete' do
  Animal.destroy( params[:id] )
  redirect to('/animals')
end

get '/adoptable' do
  @animals = Animal.all
  erb(:"animals/adoptable")
end

get '/training' do
  @animals = Animal.all
  erb(:"animals/training")
end