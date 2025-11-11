# Quick Start Guide

Get up and running with your new VS2026 solution in minutes!

## 🚀 Quick Setup (Recommended)

### Option 1: Using the Initialization Script (Bash/Linux/macOS)

```bash
# Clone or download this template
git clone https://github.com/visionarycoder/VS2026.New-Solution.git my-new-project
cd my-new-project

# Run the initialization script with sample projects
./init-solution.sh --name MyCompany.MyProduct --sample-projects

# Open in Visual Studio 2026
start MyCompany.MyProduct.slnx
```

### Option 2: Using PowerShell (Windows)

```powershell
# Clone or download this template
git clone https://github.com/visionarycoder/VS2026.New-Solution.git my-new-project
cd my-new-project

# Run the initialization script with sample projects
.\init-solution.ps1 -Name MyCompany.MyProduct -SampleProjects

# Open in Visual Studio 2026
start MyCompany.MyProduct.slnx
```

## 📦 What You Get

After running the initialization script with `-SampleProjects`, you'll have:

- ✅ A properly named solution file (`.slnx` format)
- ✅ A Core class library project in `src/`
- ✅ An xUnit test project in `tests/`
- ✅ All documentation and best practices files
- ✅ A working CI/CD pipeline configuration
- ✅ Everything built and tested successfully

## 🎯 Next Steps

1. **Start Coding**: Add your business logic to `MyCompany.MyProduct.Core`
2. **Add Tests**: Write tests in `MyCompany.MyProduct.Core.Tests`
3. **Document Decisions**: Create ADRs in `docs/adr/` for important decisions
4. **Customize CI/CD**: Edit `.github/workflows/ci.yml` for your needs
5. **Update Docs**: Keep `README.md` current with your project

## 🛠️ Manual Setup (Without Script)

If you prefer to set things up manually:

1. **Rename the solution file**
   ```bash
   mv Solution.slnx MyCompany.MyProduct.slnx
   ```

2. **Create your first project**
   ```bash
   dotnet new classlib -n MyCompany.MyProduct.Core -o src/MyCompany.MyProduct.Core
   dotnet sln MyCompany.MyProduct.slnx add src/MyCompany.MyProduct.Core/MyCompany.MyProduct.Core.csproj
   ```

3. **Create a test project**
   ```bash
   dotnet new xunit -n MyCompany.MyProduct.Core.Tests -o tests/MyCompany.MyProduct.Core.Tests
   dotnet sln MyCompany.MyProduct.slnx add tests/MyCompany.MyProduct.Core.Tests/MyCompany.MyProduct.Core.Tests.csproj
   dotnet add tests/MyCompany.MyProduct.Core.Tests reference src/MyCompany.MyProduct.Core
   ```

4. **Build and test**
   ```bash
   dotnet build
   dotnet test
   ```

## 📚 Learn More

- [Full README](README.md) - Complete documentation
- [Best Practices](.best-practices) - Team guidelines
- [Contributing Guide](docs/CONTRIBUTING.md) - How to contribute
- [ADRs](docs/adr/README.md) - Architecture decisions

## 💡 Pro Tips

### Use GitHub Copilot

The template includes pre-configured Copilot instructions at `.github/copilot-instructions.md` to help AI understand your project structure and conventions.

### Keep Dependencies Updated

```bash
# Check for outdated packages
dotnet list package --outdated

# Update packages
dotnet add package PackageName
```

### Run CI Locally

Test your changes before pushing:

```bash
# Restore, build, and test
dotnet restore
dotnet build --configuration Release
dotnet test --configuration Release

# Check formatting
dotnet format --verify-no-changes
```

### Use the Template as-is

This repository is designed to be used as a GitHub template. Click "Use this template" on GitHub to create a new repository with this structure.

## ❓ Common Issues

### Script Permission Denied (Linux/macOS)

```bash
chmod +x init-solution.sh
./init-solution.sh --help
```

### .NET SDK Not Found

Download and install the .NET SDK from [dotnet.microsoft.com](https://dotnet.microsoft.com/download)

### Visual Studio Can't Open .slnx

Make sure you're using Visual Studio 2026 or later. The `.slnx` format is not supported in earlier versions.

## 🎉 You're Ready!

That's it! You now have a professional Visual Studio 2026 solution template with all the modern best practices built in.

Happy coding! 🚀
