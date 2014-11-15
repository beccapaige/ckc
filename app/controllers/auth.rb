get ' /signup' do
	erb :sign_up
end

post '/signup' do
	newuser = User.new(params[:user])

	if newuser.save
		session[:user_id] = newuser.id
		redirect to '/home'
	else
		set_error("Invalid username and/or password.")
		redirect to '/signup'
	end
end

get '/login' do
	erb :log_in
end

post '/login' do
	user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

	if user
		session[:user_id] = user.id
		redirect to '/home'
	else
		set_error("Incorrect username and/or password.")
		redirect to '/'
	end

end


get '/logout' do 
	session[:user_id] = nil
	redirect to '/'
end
