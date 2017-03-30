require "bundler"
Bundler.require

class ExampleWorker
  include Sidekiq::Worker

  def perform(message)
    puts message
  end
end
