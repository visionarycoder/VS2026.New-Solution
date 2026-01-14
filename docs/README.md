# Documentation

Welcome to the documentation for this project.

## Contents

- [Architecture Decision Records (ADRs)](adr/README.md) - Important architectural decisions
- [Contributing Guidelines](CONTRIBUTING.md) - How to contribute to this project

## Quick Links

### For Developers

- [Getting Started](#getting-started)
- [Building the Project](#building)
- [Running Tests](#testing)
- [Best Practices](../.best-practices)

### For Contributors

- [Contributing Guide](CONTRIBUTING.md)
- [Code of Conduct](CONTRIBUTING.md#code-of-conduct)

## Getting Started

1. Clone the repository
2. Open `Solution.slnx` in Visual Studio 2026
3. Restore NuGet packages
4. Build the solution

## Building

```bash
dotnet restore
dotnet build
```

## Testing

```bash
dotnet test
```

## Architecture

This solution follows modern .NET best practices:

- **src/**: Contains all source code projects
- **tests/**: Contains all test projects
- **docs/**: Contains documentation and ADRs
- **.github/**: Contains GitHub-specific configurations

## Additional Resources

- [ADR Index](adr/README.md)
- [Best Practices](../.best-practices)
- [Copilot Instructions](../.github/copilot-instructions.md)
