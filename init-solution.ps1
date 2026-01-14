# VS2026 Solution Initialization Script (PowerShell)
# This script helps set up a new solution from the template

param(
    [Parameter(HelpMessage="Full solution name (e.g., Contoso.ECommerce)")]
    [string]$Name,
    
    [Parameter(HelpMessage="Company name (e.g., Contoso)")]
    [string]$Company,
    
    [Parameter(HelpMessage="Product name (e.g., ECommerce)")]
    [string]$Product,
    
    [Parameter(HelpMessage="Create sample projects (Core, Tests)")]
    [switch]$SampleProjects,
    
    [Parameter(HelpMessage="Show verbose output")]
    [switch]$Verbose,
    
    [Parameter(HelpMessage="Show help message")]
    [switch]$Help
)

# Function to print colored output
function Write-Info {
    param([string]$Message)
    Write-Host "ℹ " -ForegroundColor Blue -NoNewline
    Write-Host $Message
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠ " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

function Write-Err {
    param([string]$Message)
    Write-Host "✗ " -ForegroundColor Red -NoNewline
    Write-Host $Message
}

function Show-Help {
    @"
VS2026 Solution Initialization Script

Usage: .\init-solution.ps1 [OPTIONS]

Options:
    -Name NAME              Full solution name (e.g., Contoso.ECommerce)
    -Company COMPANY        Company name (e.g., Contoso)
    -Product PRODUCT        Product name (e.g., ECommerce)
    -SampleProjects         Create sample projects (Core, Tests)
    -Verbose                Verbose output
    -Help                   Show this help message

Examples:
    # Initialize with full name
    .\init-solution.ps1 -Name Contoso.ECommerce

    # Initialize with separate company and product
    .\init-solution.ps1 -Company Contoso -Product ECommerce

    # Initialize with sample projects
    .\init-solution.ps1 -Name Contoso.ECommerce -SampleProjects

Notes:
    - If you provide -Name, it should be in format Company.Product
    - Either -Name OR (-Company AND -Product) is required
    - Solution.slnx will be renamed to match your solution name
"@
}

# Show help if requested
if ($Help) {
    Show-Help
    exit 0
}

# Validate inputs
if (-not $Name -and (-not $Company -or -not $Product)) {
    Write-Err "Either -Name OR (-Company AND -Product) must be provided"
    Write-Host ""
    Show-Help
    exit 1
}

# Parse solution name if provided
if ($Name) {
    if ($Name -match '^([^.]+)\.(.+)$') {
        $Company = $Matches[1]
        $Product = $Matches[2]
    } else {
        Write-Err "Solution name should be in format Company.Product (e.g., Contoso.ECommerce)"
        exit 1
    }
} else {
    $Name = "$Company.$Product"
}

Write-Info "Initializing solution: $Name"
Write-Info "Company: $Company"
Write-Info "Product: $Product"
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "Solution.slnx")) {
    Write-Err "Solution.slnx not found. Please run this script from the repository root."
    exit 1
}

# Check if dotnet is installed
try {
    $dotnetVersion = dotnet --version
    if ($Verbose) {
        Write-Info ".NET SDK version: $dotnetVersion"
    }
} catch {
    Write-Err ".NET SDK not found. Please install .NET SDK 8.0 or later."
    exit 1
}

# Rename solution file
Write-Info "Renaming solution file..."
Move-Item "Solution.slnx" "$Name.slnx" -Force
Write-Success "Solution file renamed to $Name.slnx"

# Update README.md with solution name
Write-Info "Updating README.md..."
$readmeContent = Get-Content "README.md" -Raw
$readmeContent = $readmeContent -replace "YourCompany\.YourProduct", $Name
$readmeContent = $readmeContent -replace "your-solution-name", $Name
Set-Content "README.md" $readmeContent -NoNewline
Write-Success "README.md updated"

# Create sample projects if requested
if ($SampleProjects) {
    Write-Info "Creating sample projects..."
    
    # Create Core project
    Write-Info "Creating $Name.Core project..."
    dotnet new classlib -n "$Name.Core" -o "src/$Name.Core" | Out-Null
    dotnet sln "$Name.slnx" add "src/$Name.Core/$Name.Core.csproj" | Out-Null
    Write-Success "Core project created"
    
    # Create Tests project
    Write-Info "Creating $Name.Core.Tests project..."
    dotnet new xunit -n "$Name.Core.Tests" -o "tests/$Name.Core.Tests" | Out-Null
    dotnet sln "$Name.slnx" add "tests/$Name.Core.Tests/$Name.Core.Tests.csproj" | Out-Null
    
    # Add reference from tests to core
    dotnet add "tests/$Name.Core.Tests" reference "src/$Name.Core" | Out-Null
    Write-Success "Tests project created"
    
    # Build to verify everything works
    Write-Info "Building solution to verify setup..."
    $buildOutput = dotnet build "$Name.slnx" --verbosity quiet 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Build successful"
    } else {
        Write-Err "Build failed"
        if ($Verbose) {
            Write-Host $buildOutput
        }
        exit 1
    }
    
    # Run tests
    Write-Info "Running tests..."
    $testOutput = dotnet test "$Name.slnx" --verbosity quiet --nologo 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Tests passed"
    } else {
        Write-Err "Tests failed"
        if ($Verbose) {
            Write-Host $testOutput
        }
        exit 1
    }
}

# Final instructions
Write-Host ""
Write-Success "Solution initialization complete!"
Write-Host ""
Write-Info "Next steps:"
Write-Host "  1. Open $Name.slnx in Visual Studio 2026"
if (-not $SampleProjects) {
    Write-Host "  2. Add your projects to the src/ directory"
    Write-Host "  3. Add test projects to the tests/ directory"
}
Write-Host "  4. Review and update .best-practices for your team"
Write-Host "  5. Update docs/CONTRIBUTING.md with project-specific guidelines"
Write-Host "  6. Create ADRs in docs/adr/ for architectural decisions"
Write-Host "  7. Update .github/workflows/ci.yml for your CI/CD needs"
Write-Host ""
Write-Info "For more information, see README.md and docs/README.md"
Write-Host ""
Write-Success "Happy coding! 🚀"
