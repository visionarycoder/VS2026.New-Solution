# Source Code

This directory contains all production source code for the solution.

## Structure

Organize your projects logically:

```
src/
├── YourCompany.YourProduct.Core/      # Core business logic
├── YourCompany.YourProduct.Api/       # API/Web project
├── YourCompany.YourProduct.Data/      # Data access layer
└── YourCompany.YourProduct.Shared/    # Shared utilities and models
```

## Naming Convention

Use the following naming pattern for projects:

```
[CompanyName].[ProductName].[Component]
```

Examples:
- `Contoso.ECommerce.Core`
- `Contoso.ECommerce.Api`
- `Contoso.ECommerce.Data`

## Adding a New Project

### Using Visual Studio 2026

1. Right-click on the `src` folder in Solution Explorer
2. Select **Add** > **New Project**
3. Choose your project template
4. Name your project following the convention
5. The project will be automatically added to `Solution.slnx`

### Using .NET CLI

```bash
# Create a new project
dotnet new classlib -n YourCompany.YourProduct.Core -o src/YourCompany.YourProduct.Core

# Add to solution
dotnet sln add src/YourCompany.YourProduct.Core/YourCompany.YourProduct.Core.csproj
```

## Best Practices

- One project per functional component
- Keep dependencies minimal and explicit
- Follow SOLID principles
- Use dependency injection
- Document public APIs with XML comments
