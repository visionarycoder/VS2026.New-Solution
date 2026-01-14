# VS2026 Solution Template

A professional Visual Studio 2026 solution template using the new `.slnx` format with best practices, documentation, and tooling setup.

## Features

✅ **Modern Solution Format**: Uses the new XML-based `.slnx` format for Visual Studio 2026  
✅ **Best Practices**: Comprehensive `.best-practices` guide for the team  
✅ **Documentation**: ADR templates, contributing guidelines, and README files  
✅ **GitHub Copilot**: Pre-configured instructions for AI assistance  
✅ **CI/CD Ready**: GitHub Actions workflow for automated builds and tests  
✅ **NuGet Configuration**: Pre-configured package sources and settings  
✅ **Organized Structure**: Separate directories for source, tests, and docs  

## Quick Start

> **New to this template?** Check out the [Quick Start Guide](QUICKSTART.md) for a step-by-step walkthrough!

### Prerequisites

- Visual Studio 2026 or later
- .NET SDK 8.0 or later
- Git

### Using This Template

1. **Create a new repository from this template** (on GitHub, click "Use this template")

2. **Clone your new repository**
   ```bash
   git clone https://github.com/yourusername/your-solution-name.git
   cd your-solution-name
   ```

3. **Run the initialization script** (coming soon)
   ```bash
   ./init-solution.sh --name "YourCompany.YourProduct"
   ```

4. **Open in Visual Studio 2026**
   ```bash
   # Open the .slnx file
   start Solution.slnx
   ```

### Manual Setup

If you prefer manual setup:

1. **Rename the solution file** from `Solution.slnx` to `YourProduct.slnx`

2. **Create your first project**
   ```bash
   # Create a class library
   dotnet new classlib -n YourCompany.YourProduct.Core -o src/YourCompany.YourProduct.Core
   
   # Create a test project
   dotnet new xunit -n YourCompany.YourProduct.Core.Tests -o tests/YourCompany.YourProduct.Core.Tests
   
   # Add reference
   dotnet add tests/YourCompany.YourProduct.Core.Tests reference src/YourCompany.YourProduct.Core
   ```

3. **Add projects to solution** (in Visual Studio or manually edit Solution.slnx)

## Directory Structure

```
.
├── .github/
│   ├── copilot-instructions.md    # GitHub Copilot configuration
│   └── workflows/
│       └── ci.yml                 # CI/CD pipeline
├── .nuget/
│   └── NuGet.Config              # NuGet package sources
├── docs/
│   ├── adr/                      # Architecture Decision Records
│   │   ├── README.md
│   │   ├── 0000-adr-template.md
│   │   └── 0001-use-slnx-format.md
│   ├── CONTRIBUTING.md           # Contribution guidelines
│   └── README.md                 # Documentation index
├── src/
│   └── README.md                 # Source code guidelines
├── tests/
│   └── README.md                 # Testing guidelines
├── .best-practices               # Team best practices
├── .editorconfig                 # Editor configuration
├── .gitignore                    # Git ignore rules
├── Directory.Build.props         # MSBuild properties
├── global.json                   # .NET SDK version
├── init-solution.ps1             # PowerShell init script
├── init-solution.sh              # Bash init script
├── LICENSE                       # Project license
├── QUICKSTART.md                 # Quick start guide
├── README.md                     # This file
└── Solution.slnx                 # VS2026 solution file
```

## Building and Testing

### Build the Solution

```bash
# Restore dependencies
dotnet restore

# Build
dotnet build

# Build in Release mode
dotnet build --configuration Release
```

### Run Tests

```bash
# Run all tests
dotnet test

# Run with code coverage
dotnet test --collect:"XPlat Code Coverage"
```

## Documentation

- **[Best Practices](.best-practices)**: Coding standards and guidelines
- **[Contributing Guide](docs/CONTRIBUTING.md)**: How to contribute
- **[ADRs](docs/adr/README.md)**: Architecture decisions
- **[Source Code](src/README.md)**: Source organization
- **[Tests](tests/README.md)**: Testing strategy

## GitHub Copilot Integration

This template includes pre-configured GitHub Copilot instructions at `.github/copilot-instructions.md` to help AI assistance understand:

- Project structure and conventions
- Coding standards
- Architecture patterns
- Testing requirements
- Documentation expectations

## CI/CD

The template includes a basic GitHub Actions workflow (`.github/workflows/ci.yml`) that:

- Builds the solution on every push/PR
- Runs all tests
- Generates code coverage reports
- Performs code quality checks

## What's the SLNX Format?

The `.slnx` format is the new XML-based solution file format introduced in Visual Studio 2026. Benefits include:

- **Better merge resolution**: XML structure reduces merge conflicts
- **Human readable**: Easy to read and understand
- **Future-proof**: Designed for modern development workflows
- **Version control friendly**: Cleaner diffs in pull requests

See [ADR-0001](docs/adr/0001-use-slnx-format.md) for more details on this decision.

## Customization

### Updating Project Names

1. Edit `Solution.slnx` and update project paths
2. Update namespace names in code files
3. Update documentation to reflect new names
4. Update CI/CD workflows if needed

### Adding GitHub Actions Workflows

Add additional workflow files to `.github/workflows/` for:

- Deployment pipelines
- Release automation
- Security scanning
- Performance testing

### Configuring NuGet Feeds

Edit `.nuget/NuGet.Config` to add private feeds:

```xml
<add key="MyPrivateFeed" value="https://myfeed.example.com/nuget/v3/index.json" />
```

## Contributing

Please read [CONTRIBUTING.md](docs/CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the Unlicense - see the [LICENSE](LICENSE) file for details.

## Support

For questions and support:

- Open an issue on GitHub
- Check the [documentation](docs/README.md)
- Review [ADRs](docs/adr/README.md) for architectural context

## Acknowledgments

- Visual Studio 2026 team for the new SLNX format
- ADR methodology from [Michael Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
- Best practices from the .NET community
