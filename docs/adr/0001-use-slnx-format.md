# 1. Use SLNX Format for Solution File

Date: 2025-11-11

## Status

Accepted

## Context

Visual Studio 2026 introduces a new solution file format (.slnx) that replaces the traditional .sln format. The SLNX format is XML-based and provides better support for modern development workflows, including improved merge conflict resolution, better readability, and enhanced extensibility.

## Decision

We will use the .slnx format for this solution template instead of the legacy .sln format.

## Consequences

### Positive Consequences

- **Better Merge Conflict Resolution**: XML-based format is easier to merge than the legacy .sln format
- **Improved Readability**: Human-readable XML structure makes it easier to understand solution configuration
- **Modern Tool Support**: Better integration with Visual Studio 2026 and future versions
- **Extensibility**: XML format allows for easier extension and customization
- **Version Control Friendly**: Cleaner diffs and easier to review changes

### Negative Consequences

- **Backward Compatibility**: Older versions of Visual Studio (pre-2026) cannot open .slnx files
- **Tool Ecosystem**: Some third-party tools may not yet support .slnx format
- **Learning Curve**: Developers familiar with .sln format need to learn the new format

## Alternatives Considered

### Continue Using .sln Format

- Description: Stick with the traditional .sln format
- Pros: 
  - Universal compatibility with all Visual Studio versions
  - Well-established tooling support
  - Familiar to all .NET developers
- Cons:
  - Poor merge conflict resolution
  - Binary-like format difficult to read
  - Limited extensibility
  - Not future-proof

## Related Decisions

- None

## Notes

Microsoft recommends migrating to .slnx for new projects starting with Visual Studio 2026. The format is designed to be the default going forward.
