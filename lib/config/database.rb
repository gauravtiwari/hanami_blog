require 'sequel'

DB = Sequel.connect(
  'postgres://localhost/hanami_blog_development',
  max_connections: 10,
  logger: Logger.new("log/sequel.log")
)
