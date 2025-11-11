namespace SampleLibrary.Tests;

public class CalculatorTests
{
    private readonly Calculator _calculator;

    public CalculatorTests()
    {
        _calculator = new Calculator();
    }

    [Fact]
    public void Add_TwoPositiveNumbers_ReturnsCorrectSum()
    {
        // Arrange
        int a = 5, b = 3;

        // Act
        int result = _calculator.Add(a, b);

        // Assert
        Assert.Equal(8, result);
    }

    [Fact]
    public void Subtract_TwoNumbers_ReturnsCorrectDifference()
    {
        // Arrange
        int a = 10, b = 3;

        // Act
        int result = _calculator.Subtract(a, b);

        // Assert
        Assert.Equal(7, result);
    }

    [Fact]
    public void Multiply_TwoNumbers_ReturnsCorrectProduct()
    {
        // Arrange
        int a = 4, b = 5;

        // Act
        int result = _calculator.Multiply(a, b);

        // Assert
        Assert.Equal(20, result);
    }

    [Fact]
    public void Divide_TwoNumbers_ReturnsCorrectQuotient()
    {
        // Arrange
        int a = 10, b = 2;

        // Act
        double result = _calculator.Divide(a, b);

        // Assert
        Assert.Equal(5.0, result);
    }

    [Fact]
    public void Divide_ByZero_ThrowsDivideByZeroException()
    {
        // Arrange
        int a = 10, b = 0;

        // Act & Assert
        Assert.Throws<DivideByZeroException>(() => _calculator.Divide(a, b));
    }
}
