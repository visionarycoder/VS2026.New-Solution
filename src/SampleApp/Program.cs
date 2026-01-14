using SampleLibrary;

// Demonstrate the Calculator class
var calculator = new Calculator();

Console.WriteLine("=== Sample Calculator Demo ===");
Console.WriteLine();

int a = 10, b = 5;

Console.WriteLine($"Addition: {a} + {b} = {calculator.Add(a, b)}");
Console.WriteLine($"Subtraction: {a} - {b} = {calculator.Subtract(a, b)}");
Console.WriteLine($"Multiplication: {a} * {b} = {calculator.Multiply(a, b)}");
Console.WriteLine($"Division: {a} / {b} = {calculator.Divide(a, b)}");

Console.WriteLine();
Console.WriteLine("Calculator operations completed successfully!");
