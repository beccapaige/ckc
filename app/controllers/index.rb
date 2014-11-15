get '/' do 
	erb :index
end

get '/home' do 
	erb :home
end

get '/profile/:id' do |id|
	@user = User.find(id)
	erb :profile
end