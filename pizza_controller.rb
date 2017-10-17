require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/pizza' )

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

get '/pizzas/new' do
  erb(:new)
end

get '/pizzas/:id' do
  @pizza = Pizza.find( params[:id].to_i )
  erb(:show)
end

post '/pizzas' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id].to_i).delete
  erb(:destroy)
  redirect '/pizzas'
end

get '/pizzas/:id/update' do
  @pizza = Pizza.find(params[:@id].to_i)
  erb(:update)
  # @pizza.update()
end
