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
          ok_object: {
            properties: {
              code: { type: 'integer', example: 0 },
              message: { type: 'string', example: 'ok' },
              data: { type: 'object' }
            }
          },
          err_object: {
            properties: {
              code: { type: 'integer', example: -1 },
              message: { type: 'string', example: 'err' },
              data: { type: 'object' }
            }
          },
          user: {
            properties: {
              user_code: { type: :string, example: '100000', description: 'User Code' },
              user_no: { type: :string, example: 'A8000', description: 'User No' },
              phone: { type: :string, example: '13800138000', description: 'User Phone' },
              nickname: { type: :string, example: 'john', description: 'User Nickname' },
              email: { type: :string, example: 'john@example.com', description: 'User Email' }
            }
          },
          login_req: {
            properties: {
              phone: {
                type: :string,
                example: '13800138000'
              },
              code: {
                type: :string,
                example: '1234',
                description: 'Verification code for user registration'
              }
            }
          },
          send_req: {
            properties: {
              phone: {
                type: :string,
                example: '13800138000',
                description: 'User phone number'
              }
            }
          }
        },
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
