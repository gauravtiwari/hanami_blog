module Web::Controllers::Posts
  class Show
    include Web::Action
    expose :post

    def call(params)
      @post = Post.find(id: params[:id])
    end
  end
end
