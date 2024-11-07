# Aphrodite Rails API Scaffold

Aphrodite is a template project based on [Rails](https://rubyonrails.org) that aims to help developers get started quickly and gain a deep understanding of the framework's usage process. The project provides comprehensive sample code and configurations, covering common development scenarios for easy learning and practice. In addition, Aphrodite also includes container deployment templates, making the project easy to deploy and manage in modern cloud environments, helping developers efficiently build and release applications.

## Tech Stack

| Technology                                                | Description                                                                                   |
| --------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [tokio](https://github.com/tokio-rs/tokio)                | Asynchronous runtime, supporting multiple asynchronous functions and full features            |
| [clap](https://github.com/clap-rs/clap)                   | Command line parameter parsing library, supporting derivative macros                          |
| [thiserror](https://github.com/dtolnay/thiserror)         | Error handling library, providing concise error definitions                                   |
| [anyhow](https://github.com/dtolnay/anyhow)               | Flexible error handling library, suitable for simplifying error propagation                   |
| [base64](https://crates.io/crates/base64)                 | Base64 encoding and decoding library                                                          |
| [time](https://crates.io/crates/time)                     | Time processing library, supporting macros, local time zone, formatting and parsing functions |
| [serde](https://serde.rs/)                                | Data serialization and deserialization library, support for derivative macros                 |
| [serde_json](https://crates.io/crates/serde_json)         | JSON data serialization and deserialization library                                           |
| [tracing](https://github.com/tokio-rs/tracing)            | Asynchronous application logging framework                                                    |
| [tracing-subscriber](https://github.com/tokio-rs/tracing) | Log subscriber, support for JSON format                                                       |

## Features

- **User authentication and authorization**: Provides basic user login and permission authorization functions.
- **Distributed lock**: A distributed lock based on Redis to ensure resource security in a distributed environment.
- **Middleware support**: Built-in commonly used middleware, including authentication, request logging, cross-domain processing, etc.
- **Unified output format**: Provides a simple and easy-to-use API Result unified output method, standardizes the API response format, and improves interface consistency.
- **API modular design**: Supports modular API design, easy to expand and maintain.
- **Swagger document integration**: Automatically generate API documents to facilitate front-end development and testing.

## Module description

```
.
├── app/ # Application core code
├── bin/ # Executable script
├── config/ # Configuration file
├── db/ # Database related
├── deploy/ # Deployment related files
├── docs/ # Project documentation
├── lib/ # Custom library files
├── public/ # Public resources
├── storage/ # File storage
├── test/ # Test files
├── tmp/ # Temporary files
├── vendor/ # Third-party code
└── README.md # Project description
```

## Local operation

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
deploy/db.sql

# 5. Start the service
bin/rails server
```

## Repo Activity

![Alt](https://repobeats.axiom.co/api/embed/92f87152abeaf234940e0a4979ac2644ab05a54f.svg "Repobeats analytics image")

## Contribution

If you have any suggestions or ideas, welcome to create an issue or submit a Pull Request directly.

1. Fork this repository.

2. Create a new branch: git checkout -b feature/your-feature
3. Commit your changes: git commit -m 'Add new feature'

4. Push to your branch: git push origin feature/your-feature
5. Submit a Pull Request.

## License

This project follows the MIT license.

## Acknowledgements

Special thanks to all contributors and supporters, your help is very important to us!
