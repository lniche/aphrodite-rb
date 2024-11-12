require 'swagger_helper'

RSpec.describe 'v1/user', type: :request do
  path '/v1/user' do
    get 'User Info' do
      tags 'User Module'
      produces 'application/json'
      parameter name: :user_code, in: :query, type: :string, description: 'User Code'
      security [{ Authorization: [] }]
      response '200', 'Successful Response' do
        schema '$ref' => '#/components/schemas/get_user_response'
        run_test!
      end
    end
  end

  path '/v1/user' do
    put 'User Update' do
      tags 'User Module'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :body, schema: { '$ref' => '#/components/schemas/update_user_request' }
      security [{ Authorization: [] }]
      response '200', 'Successful Response' do
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

  path '/v1/user' do
    delete 'User Delete' do
      tags 'User Module'
      consumes 'application/json'
      produces 'application/json'
      security [{ Authorization: [] }]
      response '200', 'Successful Response' do
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
