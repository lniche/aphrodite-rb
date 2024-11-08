# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|

  config.openapi_root = Rails.root.join('docs').to_s

  config.openapi_specs = {
      'openapi.json' => {
        openapi: '3.0.1',
        info: {
          title: 'Aphrodite API',
          description: 'API Description',
          version: '1.0.0'
        },
        paths: {},
        servers: [
          {
            url: 'http://localhost:8000',
            description: "Development Environment"
          },
          {
            url: 'http://test.aphrodite.com',
            description: "Test Environment"
          }
        ]
      }
    }

  config.openapi_format = :json
end
