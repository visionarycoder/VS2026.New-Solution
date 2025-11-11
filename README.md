# VS2026.New-Solution

A starter template for Visual Studio 2026 .NET solutions. This repository demonstrates a well-organized solution structure with a sample application, class library, and unit tests.

## Project Structure

```
VS2026.NewSolution/
├── src/
│   ├── SampleApp/          # Console application demonstrating library usage
│   └── SampleLibrary/      # Class library with sample Calculator implementation
└── tests/
    └── SampleLibrary.Tests/ # xUnit test project
```

## Prerequisites

- [.NET 9.0 SDK](https://dotnet.microsoft.com/download) or later
- Visual Studio 2026, Visual Studio Code, or any .NET-compatible IDE

## Getting Started

### Building the Solution

```bash
dotnet build
```

### Running Tests

```bash
dotnet test
```

### Running the Sample Application

```bash
dotnet run --project src/SampleApp/SampleApp.csproj
```

## What's Included

- **SampleLibrary**: A simple calculator class demonstrating:
  - Basic arithmetic operations (Add, Subtract, Multiply, Divide)
  - XML documentation comments
  - Exception handling

- **SampleApp**: A console application that:
  - References and uses the SampleLibrary
  - Demonstrates the calculator functionality

- **SampleLibrary.Tests**: Unit tests using xUnit that:
  - Test all calculator operations
  - Include edge cases (division by zero)
  - Follow Arrange-Act-Assert pattern

## Using This Template

This template can serve as a starting point for your own .NET solutions. To customize:

1. Rename the solution and projects to match your needs
2. Modify or replace the sample code with your implementation
3. Add additional projects as needed (Web APIs, Blazor apps, etc.)
4. Update this README to reflect your project's purpose

## License

This is free and unencumbered software released into the public domain. See the [LICENSE](LICENSE) file for details 
