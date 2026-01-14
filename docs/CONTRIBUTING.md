# Contributing Guidelines

Thank you for considering contributing to this project! This document outlines the process and guidelines for contributing.

## Code of Conduct

Be respectful, inclusive, and professional in all interactions.

## How to Contribute

### Reporting Issues

1. Check if the issue already exists
2. Use the issue template if available
3. Provide clear reproduction steps
4. Include relevant error messages and logs

### Submitting Changes

1. **Fork the repository**
2. **Create a feature branch** from `main`
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
   - Follow the coding standards in `.best-practices`
   - Add tests for new functionality
   - Update documentation as needed
4. **Commit your changes**
   - Write clear, descriptive commit messages
   - Follow conventional commits format (optional)
   ```
   feat: add new feature
   fix: resolve bug in module
   docs: update README
   test: add unit tests
   ```
5. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Create a Pull Request**
   - Describe your changes clearly
   - Reference any related issues
   - Ensure all checks pass

## Development Setup

### Prerequisites

- Visual Studio 2026 or later
- .NET SDK (version specified in global.json if present)
- Git

### Building the Project

```bash
dotnet restore
dotnet build
```

### Running Tests

```bash
dotnet test
```

## Coding Standards

- Follow C# coding conventions
- Use meaningful names for variables, methods, and classes
- Write XML documentation for public APIs
- Keep methods small and focused
- Write unit tests for business logic

## Pull Request Guidelines

- Keep PRs focused on a single concern
- Update tests and documentation
- Ensure all tests pass
- Keep commit history clean
- Respond to review feedback promptly

## Review Process

1. Submit PR with clear description
2. Automated checks must pass
3. Code review by maintainers
4. Address feedback
5. Approval and merge

## Questions?

If you have questions, please open an issue for discussion.

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
