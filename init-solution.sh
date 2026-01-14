#!/bin/bash

# VS2026 Solution Initialization Script
# This script helps set up a new solution from the template

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
SOLUTION_NAME=""
COMPANY_NAME=""
PRODUCT_NAME=""
CREATE_SAMPLE_PROJECTS=false
VERBOSE=false

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ ${NC}$1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to display help
show_help() {
    cat << EOF
VS2026 Solution Initialization Script

Usage: ./init-solution.sh [OPTIONS]

Options:
    -n, --name NAME              Full solution name (e.g., Contoso.ECommerce)
    -c, --company COMPANY        Company name (e.g., Contoso)
    -p, --product PRODUCT        Product name (e.g., ECommerce)
    -s, --sample-projects        Create sample projects (Core, Tests)
    -v, --verbose                Verbose output
    -h, --help                   Show this help message

Examples:
    # Initialize with full name
    ./init-solution.sh --name Contoso.ECommerce

    # Initialize with separate company and product
    ./init-solution.sh --company Contoso --product ECommerce

    # Initialize with sample projects
    ./init-solution.sh --name Contoso.ECommerce --sample-projects

Notes:
    - If you provide --name, it should be in format Company.Product
    - Either --name OR (--company AND --product) is required
    - Solution.slnx will be renamed to match your solution name

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -n|--name)
            SOLUTION_NAME="$2"
            shift 2
            ;;
        -c|--company)
            COMPANY_NAME="$2"
            shift 2
            ;;
        -p|--product)
            PRODUCT_NAME="$2"
            shift 2
            ;;
        -s|--sample-projects)
            CREATE_SAMPLE_PROJECTS=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Validate inputs
if [[ -z "$SOLUTION_NAME" ]] && [[ -z "$COMPANY_NAME" || -z "$PRODUCT_NAME" ]]; then
    print_error "Either --name OR (--company AND --product) must be provided"
    show_help
    exit 1
fi

# Parse solution name if provided
if [[ -n "$SOLUTION_NAME" ]]; then
    if [[ "$SOLUTION_NAME" == *.* ]]; then
        COMPANY_NAME=$(echo "$SOLUTION_NAME" | cut -d'.' -f1)
        PRODUCT_NAME=$(echo "$SOLUTION_NAME" | cut -d'.' -f2-)
    else
        print_error "Solution name should be in format Company.Product (e.g., Contoso.ECommerce)"
        exit 1
    fi
else
    SOLUTION_NAME="${COMPANY_NAME}.${PRODUCT_NAME}"
fi

print_info "Initializing solution: ${SOLUTION_NAME}"
print_info "Company: ${COMPANY_NAME}"
print_info "Product: ${PRODUCT_NAME}"
echo ""

# Check if we're in the right directory
if [[ ! -f "Solution.slnx" ]]; then
    print_error "Solution.slnx not found. Please run this script from the repository root."
    exit 1
fi

# Check if dotnet is installed
if ! command -v dotnet &> /dev/null; then
    print_error ".NET SDK not found. Please install .NET SDK 8.0 or later."
    exit 1
fi

# Rename solution file
print_info "Renaming solution file..."
mv Solution.slnx "${SOLUTION_NAME}.slnx"
print_success "Solution file renamed to ${SOLUTION_NAME}.slnx"

# Update README.md with solution name
print_info "Updating README.md..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/YourCompany.YourProduct/${SOLUTION_NAME}/g" README.md
    sed -i '' "s/your-solution-name/${SOLUTION_NAME}/g" README.md
else
    # Linux
    sed -i "s/YourCompany.YourProduct/${SOLUTION_NAME}/g" README.md
    sed -i "s/your-solution-name/${SOLUTION_NAME}/g" README.md
fi
print_success "README.md updated"

# Create sample projects if requested
if [[ "$CREATE_SAMPLE_PROJECTS" == true ]]; then
    print_info "Creating sample projects..."
    
    # Create Core project
    print_info "Creating ${SOLUTION_NAME}.Core project..."
    dotnet new classlib -n "${SOLUTION_NAME}.Core" -o "src/${SOLUTION_NAME}.Core"
    dotnet sln "${SOLUTION_NAME}.slnx" add "src/${SOLUTION_NAME}.Core/${SOLUTION_NAME}.Core.csproj"
    print_success "Core project created"
    
    # Create Tests project
    print_info "Creating ${SOLUTION_NAME}.Core.Tests project..."
    dotnet new xunit -n "${SOLUTION_NAME}.Core.Tests" -o "tests/${SOLUTION_NAME}.Core.Tests"
    dotnet sln "${SOLUTION_NAME}.slnx" add "tests/${SOLUTION_NAME}.Core.Tests/${SOLUTION_NAME}.Core.Tests.csproj"
    
    # Add reference from tests to core
    dotnet add "tests/${SOLUTION_NAME}.Core.Tests" reference "src/${SOLUTION_NAME}.Core"
    print_success "Tests project created"
    
    # Build to verify everything works
    print_info "Building solution to verify setup..."
    dotnet build "${SOLUTION_NAME}.slnx" --verbosity quiet
    print_success "Build successful"
    
    # Run tests
    print_info "Running tests..."
    dotnet test "${SOLUTION_NAME}.slnx" --verbosity quiet --nologo
    print_success "Tests passed"
fi

# Final instructions
echo ""
print_success "Solution initialization complete!"
echo ""
print_info "Next steps:"
echo "  1. Open ${SOLUTION_NAME}.slnx in Visual Studio 2026"
if [[ "$CREATE_SAMPLE_PROJECTS" == false ]]; then
    echo "  2. Add your projects to the src/ directory"
    echo "  3. Add test projects to the tests/ directory"
fi
echo "  4. Review and update .best-practices for your team"
echo "  5. Update docs/CONTRIBUTING.md with project-specific guidelines"
echo "  6. Create ADRs in docs/adr/ for architectural decisions"
echo "  7. Update .github/workflows/ci.yml for your CI/CD needs"
echo ""
print_info "For more information, see README.md and docs/README.md"
echo ""
print_success "Happy coding! 🚀"
