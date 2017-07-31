import UIKit
//Loops in swift
//Loops are essentially sequences of swift statements which are to be executed repeatedly until a specified condition is met. The first looping statement that I will cover is the for-in loop

//The for-in loop is used to iterate over a sequence of items contained in a collection or number range and provides a simpler alternative to the condition-increment looping technique previously described.

for index in 1...5 {
    print("Value of index is \(index)")
}

// In this example, index is the temporary variable that holds the value of an element in the range or the collection that we specify(1 through 5 inclusive). The range or collection can be an array of string values, a range operator a string of characters and other types of collections.

// In the event that a reference to the current item in a for-in loop is unecessary, the reference can be replaced with an underscore like so:

for _ in 1...3{print("Hello")} // The values in this range are not used in our loop block so this omits a reference

//Essentially, the while loop repeats a set of tasks while a specified condition is met. Here is an example of a while loop

var myCount = 0

while myCount < 20 {
    myCount += 1
}

//The repeat-while loop replaces swifts old "do-while loop". The while loop evaluates an expression before executing the code contained in the body of the loop. If the expression evaluates to false on the first check, then the code is not executed. The repeat-while loop is provided for situations where you know that the code contained in the body of the lopp will always need to be executed at least once
let f = 2
repeat {print("test")} while f > 3 //Prints test once despite the condition returning false because it is a repeat-while loop

//Having created a loop, it is possible that under certain conditions you might want to break out of the loop before the completion criteria is met (particularly if you have created an infinite loop). One such example might involve continually checking for activity on a network socket. Once activity has been detected, it will most likely be necessary to break out of the monitoring loop and perform some other task. Lets check out the break statement:

var j = 10

for _ in 0..<100{
    j += j
    
    if j > 100 {
        break
    }
    print("j = \(j)")
} // This loop was set to run 100 times but the if condition that checks if j is greater than 100 breaks the loop from executing the 4th time where j is 160 and the condition is met

//The continue statement causes all remaining code statements in a loop to be skipped, and execution to be returned to the top of the loop. In the following example, the print function is only called when the value of variable i is an even number:

var i = 1

while i < 20 {
    i += 1
    
    if (i % 2) != 0 {
        continue
    }
    
    print("i = \(i)")
}

//Swift offers the ability to use if statements just like most programming languages(this includes if-else, and if else-if else)

let m = 19

if m >= 19 {
    print("m is greater than or equal to 19")
} else {
    print("m is less than 19")
}

if m is String {
    print("m is a string")
} else if m is Int {
    print("m is an integer")
} else {
    print("variable m is neither a string or an integer")
}

//The guard statement contains a boolean expression which must evaluate to true in order for the code located after the guard statement to be executed. The guard statement must include an else clause to be executed in the event that the expression evaluates to false. The code in the else clause must contain a statement to exit the current code flow(i.e a return, break, continue or throw statement). Alternatively the else block may call any other function or method that does not return itself.

func multiplyByTen(value: Int?){
    guard let number = value, value! < 10 else {
        print("number is too high")
        return
    }
    
    let result = number * 10
    print(result)
}

multiplyByTen(value: 1)
multiplyByTen(value: 11)

//The function takes an integer value as a parameter in the form of an optional. The guard statement uses optional binding to unwrap the value and verify that it is less than 10. In the event that the variable could not be unwrapped, or that its value is greater than 9, the else clause is triggered(the print message on line 78 is promptly executed and then the return statement exits the function)

//Swift switch statements:
//The switch statement is efficient to use when if else-if constructs are becoming too messy(multiple else-if clauses)
var value = 4

switch value{
    case 0:
    print("zero")
    
    case 1:
    print("one")
    
    case 2:
    print("two")
    
    case 3:
    print("three")
    
    case 4:
    print("four")
    
    case 5:
    print("five")
    
    default:
    print("Integer out of range")
}

//Notice that each case in the switch statement doesnt contain a break because swift breaks out of the switch once the case is met automatically

//Swift switch statements have the ability to combine case statements. In the following example, numbers 0, 1 or 2 will satisfy a single case.
value = 1

switch value{
    case 0, 1, 2:
    print("zero, one or two")

    case 3:
    print("three")
    
    case 4:
    print("four")
    
    case 5:
    print("five")
    
    default:
    print("Integer out of range")
}

//Case statements may be used to implement range matching as well:
var temperature = 83

switch temperature {
    case 0...49:
    print("cold")
    
    case 50...79:
    print("warm")
    
    case 80...110:
    print("hot")
    
    default:
    print("temperature out of range")
}

//The where statement may be used within a switch case to add additional criteria required for a positive match:

switch temperature{
    case 0...49 where temperature % 2 == 0:
    print("cold and even")
    
    case 50...79 where temperature % 2 == 0:
    print("warm and even")
    
    case 80...110 where temperature % 2 == 0:
    print("hot and even")
    
    default:
    print("temperature is either out of range or an uneven number")
}

temperature = 10

switch temperature {
    case 0...49 where temperature % 2 == 0:
    print("cold and multiple of two")
    fallthrough
    
    case 0...49 where temperature % 5 == 0:
    print("cold and multiple of five")
    fallthrough
    
    case 50...79 where temperature % 2 == 0:
    print("warm and multiple of two")
    fallthrough
    
    case 50...79 where temperature % 5 == 0:
    print("warm and multiple of five")
    fallthrough
    
    case 80...110 where temperature % 2 == 0:
    print("hot and multiple of two")
    fallthrough
    
    case 80...110 where temperature % 5 == 0:
    print("hot and multiple of five")
    fallthrough
    
    default:
    print("temperature out of range or isnt a multiple of two or 5")

}

//The fallthrough statement works in the way that once a case is matched in a switch statement that contains a fallthrough, it continues on to the next case in the statement and executes whatever code is in the following statement. Multiple fallthroughs can be chained to have multiple following cases executed. In the above example, the first case is met where itself and the rest of the cases have a fallthrough. Therefore, every case statement including the default is executed 

