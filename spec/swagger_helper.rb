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
        components: {
          securitySchemes: {
            BearerAuth: {
              type: 'http',
              scheme: 'bearer',
              bearerFormat: 'JWT'
            }
          }
        },
        servers: [
          {
            url: 'http://127.0.0.1:8000',
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
