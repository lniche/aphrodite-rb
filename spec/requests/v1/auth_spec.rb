require 'swagger_helper'

RSpec.describe 'v1/auth', type: :request do

  path '/v1/send-code' do

    post('send-code auth') do
      description 'Send Verification Code'
      tags 'Auth'
      produces 'application/json'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/v1/login' do

    post('login auth') do
      description 'User Registration/Login'
      tags 'Auth'
      produces 'application/json'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/v1/logout' do

    post('logout auth') do
      description 'User Logout'
      tags 'Auth'
      produces 'application/json'
      security [ { BearerAuth: [] } ] 
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
