# Tests

This directory contains all test projects for the solution.

## Structure

Organize test projects to mirror your source structure:

```
tests/
├── YourCompany.YourProduct.Core.Tests/       # Unit tests for Core
├── YourCompany.YourProduct.Api.Tests/        # Unit tests for Api
├── YourCompany.YourProduct.Integration.Tests/ # Integration tests
└── YourCompany.YourProduct.E2E.Tests/        # End-to-end tests
```

## Naming Convention

Test projects should be named:

```
[ProjectUnderTest].Tests
[ProjectUnderTest].Integration.Tests
[ProjectUnderTest].E2E.Tests
```

Examples:
- `Contoso.ECommerce.Core.Tests`
- `Contoso.ECommerce.Integration.Tests`

## Testing Frameworks

Common testing frameworks for .NET:

- **xUnit** (Recommended): Modern, extensible testing framework
- **NUnit**: Feature-rich, widely adopted
- **MSTest**: Microsoft's testing framework, integrated with Visual Studio

## Adding a New Test Project

### Using Visual Studio 2026

1. Right-click on the `tests` folder in Solution Explorer
2. Select **Add** > **New Project**
3. Choose a test project template (xUnit, NUnit, or MSTest)
4. Name your project following the convention
5. Add reference to the project being tested

### Using .NET CLI

```bash
# Create a new xUnit test project
dotnet new xunit -n YourCompany.YourProduct.Core.Tests -o tests/YourCompany.YourProduct.Core.Tests

# Add to solution
dotnet sln add tests/YourCompany.YourProduct.Core.Tests/YourCompany.YourProduct.Core.Tests.csproj

# Add reference to project being tested
dotnet add tests/YourCompany.YourProduct.Core.Tests reference src/YourCompany.YourProduct.Core
```

## Test Organization

### Unit Tests

- Test individual methods and classes in isolation
- Mock external dependencies
- Fast execution
- Follow AAA pattern (Arrange, Act, Assert)

### Integration Tests

- Test interaction between components
- May use real databases or services
- Slower than unit tests
- Test realistic scenarios

### End-to-End Tests

- Test complete user workflows
- Use real or staging environments
- Slowest tests
- Critical path validation

## Running Tests

```bash
# Run all tests
dotnet test

# Run tests in specific project
dotnet test tests/YourCompany.YourProduct.Core.Tests

# Run with code coverage
dotnet test --collect:"XPlat Code Coverage"

# Run tests matching filter
dotnet test --filter "FullyQualifiedName~YourNamespace"
```

## Best Practices

- Write tests before or alongside production code (TDD)
- Keep tests independent and isolated
- Use meaningful test names that describe the scenario
- Follow the AAA pattern (Arrange, Act, Assert)
- Mock external dependencies in unit tests
- Aim for high code coverage (80%+)
- Keep tests fast and deterministic
- Use test fixtures for shared setup
- Clean up resources in test teardown
