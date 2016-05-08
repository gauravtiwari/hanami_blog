module Web::Controllers::Posts
  class Index
    include Web::Action
    expose :posts

    def call(params)
      @posts = Post.all
    end
  end
end
