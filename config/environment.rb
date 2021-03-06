require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require "hanami/middleware/body_parser"
require_relative '../lib/nps'
require_relative '../apps/web/application'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/api'
  mount Web::Application, at: '/'

  middleware.use Hanami::Middleware::BodyParser, :json

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/nps_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/nps_development'
    #    adapter :sql, 'mysql://localhost/nps_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/nps/mailers'

    # See https://guides.hanamirb.org/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :debug

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
