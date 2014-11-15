get '/forums' do
	@forums = Forum.all
	erb :forums	
end

get '/forums/:title' do |title|
	@forum = Forum.find_by(title: title)
	erb :all_topics
end

post '/forums/:title' do
	topic = Topic.create(params[:topic])
	forum = Forum.find(topic.forum_id)

	redirect to "/forums/#{URI.escape(forum.title)}"
end