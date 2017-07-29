import UIKit

// The most basic swift expression consists of an operator, two operands and an assignment
var myresult = 1 + 2

var x: Int? //Declare an optional Int variable
var y = 10 //Declare and initialize a second Int variable

x = 10 //Assign a value to x
x = x! + y //Assign the result of x + y to x
x = y //Assign the value of y to x

//Swift operators primarily fall into the binary operator category(taking two operands) where the exception is the unary negative operator which serves to indicate that a value is negative rather than positive. This contrasts with the subtraction operator which takes two operands(one value subtracted from another

x = -10 //Unary - operator used to assign -10 to variable x
x = x! - 5 //Subtraction operator where 5 is subtracted from x

//The way to write x = x + y in shorthand is "x+=y". Where the same can be done for every other arithmetic operator.

//Swift also includes a set of logical operators useful for performing comparisons. These operators all return a boolean result depending on the result of the comparison. These operators are binary operators in that they work with two operands. Comparison operators are most frequently used in constructing program flow control logic.

//if x == y {perform task}

/* The result of a comparison may also be stored in a bool variable.
 var result: Bool?
 var x = 10
 var y = 20
 result = x < y <- result returns true
*/

//Swift also provides a set of logical operators designed to return Boolean true or false values. These operators both return boolean results and take boolean values as operands. They key operators are NOT(!), AND(&&), OR(||)

//Swift includes two useful operators that allow ranges of values to be declared. The closed range operator and the half-closed range operator. Here is an example of the closed range operator: "x...y" (In this operator, both x, y and any number inbetween them is included in the range). The half-closed range operator's syntax looks like this: "x..<y" (In this operator, only x and any number in between x and y is included so y itself is not included)

//Swift supports use of the ternary operator. The ternary is a shorthand operator used to simplify a basic if-else statement
// condition ? truthy evaluation(if) : falsey evaluation(else)

let a = 10
let b = 20
print("Largest number is \(a > b ? a : b)")




