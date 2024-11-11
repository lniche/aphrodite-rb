# Aphrodite Rails API Scaffold

Aphrodite is a template project based on [Rails](https://rubyonrails.org) that aims to help developers get started quickly and gain a deep understanding of the framework's usage process. The project provides comprehensive sample code and configurations, covering common development scenarios for easy learning and practice. In addition, Aphrodite also includes container deployment templates, making the project easy to deploy and manage in modern cloud environments, helping developers efficiently build and release applications.

## Tech Stack

| Technology                                                               | Description                                                                                                                                                              |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [pg](https://rubygems.org/gems/pg)                                       | PostgreSQL database adapter, providing connection and operation functions with PostgreSQL database.                                                                      |
| [redis](https://rubygems.org/gems/redis)                                 | Redis client library, used to interact with Redis database in Rails application, supporting cache, message queue and other functions.                                    |
| [puma](https://rubygems.org/gems/puma)                                   | High-performance Ruby web server, widely used to deploy Rails applications, supporting multi-threaded and multi-process modes.                                           |
| [bootsnap](https://rubygems.org/gems/bootsnap)                           | Tool to speed up the startup time of Rails application, optimize the loading process and reduce the startup time of each request.                                        |
| [rails](https://rubygems.org/gems/rails)                                 | The core library of the Rails framework, providing a comprehensive MVC architecture suitable for rapid development of web applications.                                  |
| [rack-cors](https://rubygems.org/gems/rack-cors)                         | A middleware library for handling cross-domain requests (CORS), making cross-domain access possible.                                                                     |
| [sprockets-rails](https://rubygems.org/gems/sprockets-rails)             | A preprocessor for JavaScript and CSS files in Rails, used to merge and compress multiple resources.                                                                     |
| [stimulus-rails](https://rubygems.org/gems/stimulus-rails)               | Rails framework integration implemented through StimulusJS, used to build complex front-end interactions.                                                                |
| [turbo-rails](https://rubygems.org/gems/turbo-rails)                     | Part of Hotwire, optimizes the speed and user experience of web pages. By adding the Turbo function, the interface can be updated without a full page refresh.           |
| [rswag](https://rubygems.org/gems/rswag)                                 | A library for generating and displaying API documents, supporting the Swagger API document specification.                                                                |
| [rswag-api](https://rubygems.org/gems/rswag-api)                         | Provides API document generation, request validation and other functions for automatically generating API documents that comply with the Swagger specification.          |
| [rswag-ui](https://rubygems.org/gems/rswag-ui)                           | Provides a UI for displaying Swagger API documents, and supports combining with `rswag-api` to generate an interactive API document interface.                           |
| [bcrypt](https://rubygems.org/gems/bcrypt)                               | A library for encrypting passwords and implementing secure authentication, providing password hashing functions.                                                         |
| [devise](https://rubygems.org/gems/devise)                               | A Rails user authentication solution that provides registration, login, password reset and other functions.                                                              |
| [jwt](https://rubygems.org/gems/jwt)                                     | A Ruby implementation of JSON Web Token (JWT) that handles token generation and verification.                                                                            |
| [importmap-rails](https://rubygems.org/gems/importmap-rails)             | Manage front-end JavaScript resources using import maps, avoiding the complexity of package managers and packaging processes.                                            |
| [jbuilder](https://rubygems.org/gems/jbuilder)                           | A Ruby library for generating JSON responses, suitable for Rails API development.                                                                                        |
| [tzinfo-data](https://rubygems.org/gems/tzinfo-data)                     | A library that provides time zone data to ensure time zone support for Rails applications on Windows or JRuby platforms.                                                 |
| [brakeman](https://rubygems.org/gems/brakeman)                           | A static analysis tool for checking for security vulnerabilities in Rails applications.                                                                                  |
| [debug](https://rubygems.org/gems/debug)                                 | Ruby's built-in debugging tool, used to debug applications during development.                                                                                           |
| [dotenv-rails](https://rubygems.org/gems/dotenv-rails)                   | Used to load environment variables from `.env` files, making it easier to manage configuration in a development environment.                                             |
| [rubocop-rails-omakase](https://rubygems.org/gems/rubocop-rails-omakase) | Provides Rails project-specific RuboCop rules to automatically check code style.                                                                                         |
| [rspec-rails](https://rubygems.org/gems/rspec-rails)                     | Rails test framework integration for writing and running RSpec tests.                                                                                                    |
| [rswag-specs](https://rubygems.org/gems/rswag-specs)                     | RSpec extension for writing Swagger specifications, supporting automated generation of API documentation.                                                                |
| [web-console](https://rubygems.org/gems/web-console)                     | Rails development tool that allows running Ruby code directly in the browser for easy debugging.                                                                         |
| [capybara](https://rubygems.org/gems/capybara)                           | Web application automated testing tool that provides the ability to simulate user interaction with the browser, suitable for integration testing and acceptance testing. |
| [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver)       | A library for controlling browsers for automated testing. It supports multiple browsers and is often used for UI testing.                                                |

## Features

- **User authentication and authorization**: Provides basic user login and permission authorization functions.
- **Distributed lock**: A distributed lock based on Redis to ensure resource security in a distributed environment.
- **Middleware support**: Built-in commonly used middleware, including authentication, request logging, cross-domain processing, etc.
- **Unified output format**: Provides a simple and easy-to-use API Result unified output method, standardizes the API response format, and improves interface consistency.
- **API modular design**: Supports modular API design, easy to expand and maintain.
- **Swagger document integration**: Automatically generate API documents to facilitate front-end development and testing.

## Structure

```
.
├── app/        # Core application code
├── bin/        # Executable scripts
├── config/     # Configuration files
├── db/         # Database files
├── deploy/     # Deployment files
├── docs/       # Documentation
├── lib/        # Custom libraries
├── public/     # Public assets
├── storage/    # File storage
├── test/       # Tests
├── tmp/        # Temporary files
├── vendor/     # Third-party libraries
└── README.md   # Project description
```

## Run Local

```bash
# 1. Clone the project code base
git clone https://github.com/lniche/aphrodite-rb.git
cd aphrodite-rb

# 2. Configuration file
cd config
mv .env.example .env

# 3. Handle dependencies
# Make sure you have installed Ruby and Rails environment
bundle install

# 4. Initialize the database
db/init.sql

# 5. Start the service
bin/rails server
```

## Repo Activity

![Alt](https://repobeats.axiom.co/api/embed/92f87152abeaf234940e0a4979ac2644ab05a54f.svg "Repobeats analytics image")

## Contribution

If you have any suggestions or ideas, welcome to create an issue or submit a Pull Request directly.

1. **Fork** this repository.
2. **Create** a new branch:

```
git checkout -b feature/your-feature
```

3. **Commit** your changes:

```
git commit -m 'Add new feature'
```

4. **Push** to your branch:

```
git push origin feature/your-feature
```

5. **Submit** a Pull Request.

## License

This project follows the MIT license.

## Acknowledgements

Special thanks to all contributors and supporters, your help is very important to us!
