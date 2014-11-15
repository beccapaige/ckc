user = User.new(username:'Bob', password: 'password')
topic = Topic.new(title: 'hello world')
topic.update_attributes(author_id: 1)