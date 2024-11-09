require 'swagger_helper'

RSpec.describe 'v1/user', type: :request do
  path '/v1/user' do
    get 'User Info' do
      tags 'User'
      produces 'application/json'
      parameter name: :user_code, in: :query, type: :string, description: 'User Code'
      security [{ BearerAuth: [] }]
      response '200', 'Successful Response' do
        schema '$ref' => '#/components/schemas/user'
        run_test!
      end
    end
  end

  path '/v1/user' do
    put 'User Update' do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :body, schema: { '$ref' => '#/components/schemas/user' }
      security [{ BearerAuth: [] }]
      response '200', 'Successful Response' do
        schema '$ref' => '#/components/schemas/ok_object'
        run_test!
      end
    end
  end

  path '/v1/user' do
    delete 'User Delete' do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'
      security [{ BearerAuth: [] }]
      response '200', 'Successful Response' do
        schema '$ref' => '#/components/schemas/ok_object'
        run_test!
      end
    end
  end
end
