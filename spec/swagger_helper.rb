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
        schemas: {
          login_response: {
            properties: {
              access_token: { type: :string, example: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...', description: 'Access token' },
            }
          },
          update_user_request: {
            properties: {
              nickname: { type: :string, example: 'john', description: 'User Nickname' },
              email: { type: :string, example: 'john@example.com', description: 'User Email' }
            }
          },
          get_user_response: {
            properties: {
              user_code: { type: :string, example: '100000', description: 'User Code' },
              user_no: { type: :string, example: 'A8000', description: 'User No' },
              phone: { type: :string, example: '13800138000', description: 'User Phone' },
              nickname: { type: :string, example: 'john', description: 'User Nickname' },
              email: { type: :string, example: 'john@example.com', description: 'User Email' }
            }
          },
          login_request: {
            properties: {
              phone: {
                type: :string,
                example: '13800138000'
              },
              code: {
                type: :string,
                example: '1234',
                description: 'Verification code'
              }
            }
          },
          send_verifycode_request: {
            properties: {
              phone: {
                type: :string,
                example: '13800138000',
                description: 'User Phone'
              }
            }
          }
        },
        securitySchemes: {
          Authorization: {
            type: 'http',
            scheme: 'bearer',
            bearerFormat: 'JWT',
            description: 'JWT Bearer Token authentication'
          }
        }
      },
      servers: [
        {
          url: 'http://127.0.0.1:8000',
          description: 'Development Environment'
        },
        {
          url: 'http://test.aphrodite.com',
          description: 'Test Environment'
        }
      ]
    }
  }

  config.openapi_format = :json
end
