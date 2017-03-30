require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Message < ActiveRecord::Base
end

class ExampleWorker
  include Sidekiq::Worker

  def perform(message)
    m = Message.create!(body: message)
    puts m.body
  end
end
