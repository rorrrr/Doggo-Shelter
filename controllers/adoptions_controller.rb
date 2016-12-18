require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )

get '/adoptions' do
  @adoptions = Adoption.all
  erb ( :"adoptions/index" )
end

get '/adoptions/new' do
  @animals = Anaimal.all
  @owners = Owner.all
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

post '/adoptions/:id/delete' do
  Adoption.destroy(params[:id])
  redirect to("/adoptions")
end