require 'swagger_helper'

RSpec.describe 'v1/auth', type: :request do

  path '/v1/send-code' do

    post('Send Verification Code') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'
      parameter  in: :body, schema: {'$ref' => '#/components/schemas/send_req'}

      response(200, 'Successful Response') do
        schema '$ref' => '#/components/schemas/ok_object'

        run_test!
      end
    end
  end

  path '/v1/login' do

    post('User Registration/Login') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'
      parameter  in: :body, schema: {'$ref' => '#/components/schemas/login_req'}

      response(200, 'Successful Response') do
        schema '$ref' => '#/components/schemas/ok_object'

        run_test!
      end
    end
  end

  path '/v1/logout' do

    post('User Logout') do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'
      security [ { BearerAuth: [] } ] 
      response(200, 'Successful Response') do
        schema '$ref' => '#/components/schemas/ok_object'

        run_test!
      end
    end
  end
end
