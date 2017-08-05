import UIKit

//A function is a named block of code that can be called upon to perform a specific task. It can be provided data on which to perform the task and is capable of returning results to the code that called it. A function can be programmed to accept the values on which arithmetic can be performed(parameters) and return the result of a given calculation. At any point in the program code where the calculation is required the function is simply called, parameter values passed through as arguments and the result returned.

// The terms parameter and argument are often used interchangeably when discussing functions. The slight difference is that paramaters are the values that a function is able to accept when it is called. Arguments are the values that a function is passed once it is called.

/* A swift function is declared using the following syntax:
 func <function name> (<param name>: <param type>, <param name >:<param type>,...) -> <return type>{
    Function code goes here
 }
*/

//Heres an explanation of the syntax: the word func - The prefix keyword used to notify the swift compiler that this is a function. <function name> - The name assigned to a function, also the name will be used to reference the function call. <param name> - The name by which the parameter is to be referenced in the function code. <param type> - The data type for the corresponding parameter. <return type> - The data type of the result returned by the function(If the function doesn't return a result then no return type is specified).

func sayHello() {
    print("Hello")
} //This function requires no parameters because we are simply printing a static message. A value is not being returned so no return type is specified in this function

sayHello()

func buildMessageFor(name: String, count: Int) -> String {
    //print("\(name), you are customer number \(count)")  This statement prints a message to the console
    return("\(name), you are customer number \(count)") //This return statement primes the string for use after the function call and is not outputted to the console
}

buildMessageFor(name: "Justin", count: 5) //This is how to call a function with multiple args. The labels and corresponding values must match in the way that the params are presented. Omitting an argument or switching the order to (count, name) in the function call will result in an error

let message = buildMessageFor(name: "Thomas", count: 3) //This is how you can store a return value from a function into a constant(variables work just fine too)
print(message)

//When developing in swift, situations may arise where the result returned by a method or function call is not used. When this is the case, the return value may be discarded by assigning it to '_':

_ = buildMessageFor(name: "Jerry", count: 4)

//When the preceding example functions were declared, they were configured with the parameters that were assigned names which, in turn, could be referenced within the body of the function code. When declared in this way, these names are referred to as local parameter names. We can declare functions with external parameter names which are the names by which the parameter is referenced when the function is called.
//The defualt external parameter names assigned to parameters may be removed by preceding the local parameter names with an underscore

func buildMessageFor2(_ name: String, _ count: Int) -> String {
    return("\(name), you are customer number \(count)")
}

print(buildMessageFor2("Ralph", 1)) //With the external parameters removed, the function buildMessageFor2 can be called like such(omitting the name and count args)

//Alternatively, external parameter names can be added simply by declaring the external parameter name before the local parameter name within the function declaration

func buildMessageFor3(username name: String, usercount count: Int) -> String {
    return("\(name), you are customer number \(count)")
}

print(buildMessageFor3(username: "Tony", usercount: 16)) //Note hthat in this function call, we are referring to the functions external parameters(username and usercount)

//Declaring default function parameters: Swift provides the ability to designate a default parameter value to be used in the event that the value is not provided as an argument when the function is called. This simply involves assigning the default value to the parameter when the function is declared. When using default parameters, it is important that the params for which a default is being declared be placed at the end of the parameter list so that the compiler does not become confused about which parameters have been omitted during a function call.

func buildMessageFor4(_ name: String = "Customer", count: Int) -> String {
    return("\(name), you are customer number \(count)")
}

print(buildMessageFor4(count: 8)) //Name defaults to "Customer" because of default params
print(buildMessageFor4("Claire", count: 5)) //Same function with both params passed in

//Returning multiple results from a function

func sizeConverter(_ length: Float) -> (yards: Float, centimeters: Float, meters: Float){
    let yards = length * 0.0277778
    let centimeters = length * 2.54
    let meters = length * 0.0254
    
    return(yards, centimeters, meters)
}
print(sizeConverter(12.2))//This function call returns 3 values as a tuple

//We can assign the results of the function to a variable or constant and read each value individually
let size = sizeConverter(20)
print(size.meters)
print(size.centimeters)

//It is not always possible to know in advance the number of parameters a function will need to accept when it is called. Swift handles this possibility through the use of variadic parameters. Variadic parameter are declared using 3 periods "..." to indicate that the function accepts zero or more params of a specified data type.

func displayStrings(_ strings: String...){
    for string in strings {
        print(string)
    }
}

displayStrings("Hello", "i'm", "Justin")

//All params accepted by a function are treated as constants by default. This prevents changes being made to the parameter values within the function code. If changes to params need to be made within the function body, therefore, shadow copies of those parameters must be created.

func calculateArea (length: Float, width: Float) -> Float {
    var length = length
    var width = width
    
    length = length * 2.54
    width = width * 2.54
    return length * width
}

print(calculateArea(length: 10, width: 20))

var myValue = 10

func doubleValue(_ value: Int) -> Int {
    var value = value
    value += value
    return value
}

print("Before function call myValue equals \(myValue)")
print("doubleValue call returns \(doubleValue(myValue))")
print("After function call myValue equals \(myValue)")

//Clearly, the function has made no change to the original myValue variable. This is to be expected since the mathematical operation was performed on a copy of the variable, not the myValue variable itself.

//In order to make any changes made to the parameter persist after the function call, the parameter must be declared as an in-out parameter within the function declaration. Here is the function from above but modified with an in-out param:

func inOutDoubleValue(_ value: inout Int) -> Int {
    value += value
    return value
}

print("the function call with in-out params returned \(inOutDoubleValue(&myValue))")
//Notice that you have to prepend the ampersand sign to myValue because it is in reference to an inout param because otherwise an error is thrown

//An interesting feature of functions within swift is that they can be treated as data types. It is perfetly valid, for example, to assign a function to a constant or variable as illustrated in the declaration below:

func inchesToFeet (_ inches: Float) -> Float {
    return inches * 0.0833333
}

let toFeet = inchesToFeet
//A call to the function may be made using the constant name instead of the original function name

let result = toFeet(10)
//On the surface this does not seem to be a particularly compelling feature. The possibilities that this feature offers become more apparent when we consider that a function assigned to a constant or variable now has the capabilities of many other data types. In particular, a function can now be passed through as an argument to another function, or even returned as a result from a function. The data type of a function is dictated by a combination of the paramaters it accepts and the type of result it returns. The function declared up above therefore has the following data type: (Float) -> Float

//In order to accept a function as a parameter, the receiving function simply declares the data type of the function it is able to accept.

//Lets create a function that accepts another function as a param. The purpose of the receiving function will be to accept any unit conversion function as a param. For this case, lets make another unit conversion function that converts inces to yards and make the receiving function afterwards.

func inchesToYards(_ inches: Float) -> Float {
    return inches * 0.0277778
}

let toYards = inchesToYards

//Now for the receiving function:
func outputConversion(_ converterFunc: (Float) -> Float, value: Float) {
    let result = converterFunc(value)
    print("Result of conversion is \(result)")
}

outputConversion(toYards, value: 12)
outputConversion(toFeet, value: 12)

//Functions can also be returned as data types simply by declaring the type of function as the return type. Heres an example:

func decideFunction(_ feet: Bool) -> (Float) -> Float{
    if feet {
        return toFeet
    } else {
        return toYards
    }
}

//Closure and closure expressions:

//Closure expressions are self contained blocks of code. The following code, for example, declares a closure expression and assigns it to a constant and call the function via the constant reference:

let helloWorld = {print("Hello World")}
helloWorld()

/*The synax looks like this:
 {(<param name>: <param type>, <param type>, ...) -> <return type> in 
    closure code goes here
 }*/

let multiply = {(_ val1: Int, _ val2: Int) -> Int in
    return val1 * val2
}

let multiplyresult = multiply(10, 10)
//Note that the syntax is similar to that used for declaring swift functions with the exception that the closure expression does not have a neame, the params and return type are included in the braces and the in keyword is used to indicate the start of the closure expression code. Functions are closure expressions.

//Closure expressions are often used when declaring completion handlers for asynchronous method calls. In other words, when devleoping iOS applications it will often be necessary to make calls to the operating system where the requested task is performed in the background allowing the application to continue with other tasks. Typically in such a scenario, the system will notify the application of the completion of the task and return any results by calling the completion handler that was declared when the method was called. 

//Here is an example for a swift closure(A self contained block of code and one or more variables that exist in the context surrounding that code block):

func functionA() -> () -> Int {
    var counter = 0
    
    func functionB() -> Int {
        return counter + 10
    }
    return functionB
}

let myClosure = functionA()
let closureResult = myClosure()

//FunctionA returns a closure since functionB relies on the counter variable which is declared outside of functionB's local scope.
