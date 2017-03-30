require_relative "worker"

require "sidekiq/web"

run Sidekiq::Web
