namespace SampleLibrary;

/// <summary>
/// A simple calculator class demonstrating basic arithmetic operations.
/// </summary>
public class Calculator
{
    /// <summary>
    /// Adds two numbers.
    /// </summary>
    public int Add(int a, int b) => a + b;

    /// <summary>
    /// Subtracts the second number from the first.
    /// </summary>
    public int Subtract(int a, int b) => a - b;

    /// <summary>
    /// Multiplies two numbers.
    /// </summary>
    public int Multiply(int a, int b) => a * b;

    /// <summary>
    /// Divides the first number by the second.
    /// </summary>
    /// <exception cref="DivideByZeroException">Thrown when divisor is zero.</exception>
    public double Divide(int a, int b)
    {
        if (b == 0)
            throw new DivideByZeroException("Cannot divide by zero.");
        return (double)a / b;
    }
}
