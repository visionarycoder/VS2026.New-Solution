# GitHub Copilot Instructions

## Project Context
This is a Visual Studio 2026 solution template using the new `.slnx` format.

## Coding Standards
- Follow modern C# best practices and conventions
- Use nullable reference types
- Implement async/await patterns where appropriate
- Write XML documentation comments for public APIs
- Follow SOLID principles
- Use dependency injection where applicable

## Architecture Guidelines
- Place source code in `src/` directory
- Place tests in `tests/` directory
- Place documentation in `docs/` directory
- Use ADRs (Architecture Decision Records) in `docs/adr/` for significant decisions

## Testing
- Write unit tests for all business logic
- Use xUnit, NUnit, or MSTest for testing
- Aim for high code coverage (80%+)
- Follow AAA pattern (Arrange, Act, Assert)

## Documentation
- Update README.md when adding features
- Document architectural decisions in `docs/adr/`
- Keep inline documentation concise and meaningful
- Update API documentation when changing public interfaces

## Best Practices
- Review `.best-practices` file for project-specific guidelines
- Use semantic versioning
- Keep dependencies up to date
- Follow the principle of least surprise
- Write self-documenting code with clear naming
