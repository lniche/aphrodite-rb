require 'swagger_helper'

RSpec.describe 'v1/auth', type: :request do
  path '/v1/send-code' do
    post('Send Verification Code') do
      tags 'Auth Module'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :body, schema: { '$ref' => '#/components/schemas/send_verifycode_request' }

      response(200, 'Successful Response') do
        schema type: :object,
        properties: {
          code: { type: 'integer', example: 0 },
          message: { type: 'string', example: 'ok' },
          data: { type: 'object' }
        }

        run_test!
      end
    end
  end

  path '/v1/login' do
    post('User Registration/Login') do
      tags 'Auth Module'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :body, schema: { '$ref' => '#/components/schemas/login_request' }

      response(200, 'Successful Response') do
        schema '$ref' => '#/components/schemas/login_response'

        run_test!
      end
    end
  end

  path '/v1/logout' do
    post('User Logout') do
      tags 'Auth Module'
      consumes 'application/json'
      produces 'application/json'
      security [{ Authorization: [] }]
      response(200, 'Successful Response') do
        schema type: :object,
        properties: {
          code: { type: 'integer', example: 0 },
          message: { type: 'string', example: 'ok' },
          data: { type: 'object' }
        }

        run_test!
      end
    end
  end
end
