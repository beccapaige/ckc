get '/:user/updatebio' do
	erb :profile
end

put '/:user/updatebio' do |user_id|
	user = User.find(user_id)
	p params[:user]
	# user.update(params[:user])
	redirect to "/profile/#{user.id}"
end