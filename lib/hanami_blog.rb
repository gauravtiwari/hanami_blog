require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/hanami_blog/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/hanami_blog_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/hanami_blog_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/hanami_blog_development'
  #    adapter type: :sql, uri: 'mysql://localhost/hanami_blog_development'
  #
  adapter type: :sql, uri: ENV['HANAMI_BLOG_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :users do
      entity     User
      repository UserRepository

      attribute :id,   Integer
      attribute :name, String
      attribute :username, String
      attribute :email, String
      attribute :password, String
      attribute :encrypted_password, String
    end

    collection :posts do
      entity     Post
      repository PostRepository

      attribute :id,   Integer
      attribute :user_id, Integer
      attribute :body, String
      attribute :title, String
    end

    collection :comments do
      entity     Comment
      repository CommentRepository

      attribute :id,   Integer
      attribute :user_id, Integer
      attribute :post_id, Integer
      attribute :body, String
    end

    collection :votes do
      entity     Vote
      repository VoteRepository

      attribute :id,   Integer
      attribute :user_id, Integer
      attribute :post_id, Integer
      attribute :comment_id, Integer
    end

  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/hanami_blog/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
