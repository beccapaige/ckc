['/:title', '/:title/reply', '/:title/edit', '/:title/delete'].each do |title|
  before title do |t|
    @topic = Topic.find_by(title: t)
  end
end

get '/:title' do |title|
	erb :single_topic
end

get '/:title/reply' do |title|
	erb :_replyform, locals: {topic: @topic}
end

post '/:title/reply' do
	reply = Reply.create(params[:reply])
	topic = Topic.find(reply.topic_id)
	
	if request.xhr?
		return reply.content
	else
		redirect to "#{URI.escape(topic.title)}"
	end
end

get '/:title/edit' do |title|
	erb :_editform, locals: {topic: @topic}
end

put '/:title/edit' do |title|
    @topic.update(params[:topic])

    redirect to "#{URI.escape(@topic.title)}"
end

delete '/:title/delete' do |title|
	@topic.destroy
	forum = Forum.find(@topic.forum_id)
    redirect to "/forums/#{URI.escape(forum.title)}"
end

post '/:title/favorite' do
	favorite = Favorite.create(params[:favorite])
	topic = Topic.find(favorite.topic_id)
	redirect to "#{URI.escape(topic.title)}"
end
