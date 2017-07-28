import UIKit

// Integer Data types
// Signed integers are capable of storing positive, negative and zero values. Unsigned integers can store only positive integers and zero

print("Int 32 Min = \(Int32.min) Int32 Max = \(Int32.max)")

// Floating point Data types
// Floats offer a smaller amount of position compared to doubles (Doubles store up to 64 bit floating point numbers with a level of precision to 15 decimal points or greater. Floats store up to 32 bit floating point numbers with a precision of upto 6 decimal places

// Booleans Data types only evaluate to true or false

// Character Data types are any letter, numerical digit, punctuation mark or symbol that spans 1 character long. Characters can be referenced using Unicode

//String Data types
// Strings are sequences of characters that typically make up a word or sentence. The string data type can be manipulated in a plethora of ways (Searched, matched, concatenated, and modified). Strings can be constructed with a combination of variables, strings, constants, expressions and function calls with string interpolation.

var userName = "John"
var inboxCount = 25
// Variables are declared using the var keyword
let maxCount = 100
// Constants are declared using the let keyword

var message = "\(userName) has \(inboxCount) messages. Message capacity remaining is \(maxCount - inboxCount)"
print(message)

// Constants versus variables: Variables are able to be changed an infinite amount of times throughout the lifespan of your code. Once a constant is declared, its value is no longer able to be changed (This is useful when declaring values that pertain to interest rate, max and min values, etc).

// Swift is a type safe programming language. This means that once the data type of a variable has been identified, that variable cannot be subsequently be used to store data of any other type without inducing a compilation error. This contrasts to loosely typed languages where a variable can be subsequently changed to store other data types

var userCount:Int = 10
// The userCount variable is being explicitly casted as an Integer

// In the absence of a type anotation in a declaration, the swift compiler uses a technique referred to as type inference to identify the type of constant or variable

let bookTitle: String
var iosBookType = false

if iosBookType {
    bookTitle = "a"
} else {
    bookTitle = "b"
}

print(bookTitle)

// If a type annotation is ued when the constant is declared, the value can be assigned later in the code (see above example)

// The Swift Tuple
// A tuple is a way to temporarily group together multiple values of varying or the same data types in one entity.

let myTuple = (20, 32.22, "I am a string")

// tuple elements can be accessed similar to arrays in programming(via the index of a given value in the tuple)

print(myTuple.2) //Where the item in position two of the tuple is the string
// All values in a tuple can optionally be stored as variables or constants as well.
// Values in a tuple can be omitted using the "_" underscore character

//Tuple values can also be assigned names to be used in reference to given values in itself
let myTuple2 = (count: 10, Character: "a", comment: "Hello World")
print("\(myTuple2.comment) lets count to \(myTuple2.count)")

// Optional Data types
// The purpose of the optional type is to provide a safe and consistent approach to handling situations where a variable or constant may not have any value assigned to it. Variables are declared as being optional by placing a ? characted after the type declaration

var index: Int? = 32// index is declared as an optional
// the variable index can now have either an integer value assigned to it or have nothing assigned to it. An optional with no value assigned to it has a value of nil

if index != nil {
    print("The index has a value of \(index)")
} else {
    print("The index is nil")
}

//Wrapping
// If an optional has a value assigned to it, that value is said to be "wrapped" within the optional. The value wrapped in an optional may be accessed using a concept referred to as forced unwrapping. THis simply means that the underlying value is extracted from the optional data type, a procedure that is performed by placing an exclamation mark "!" after the optional name. Not unwrapping a value assigned optional in a reference to it will result in an error being thrown that asks the developer to unwrap the optional.

index = 3

var treeArray = ["Oak", "Pine", "Yew", "Birch"]

if index != nil {
    print(treeArray[index!]) // using "index" would throw an error
} else {
    print("Index is nil")
}

//As an alternatiove to forced unwrapping, the value assigned to an optional may be allocated to a temporary variable or constant using optional binding. Heres the syntax:
//  if let constantName = optionalName{run this code}
//  if var variableName = optionalName{run this code}
// lets redo the code from above using optional binding:

index = 2

treeArray = ["Oak", "Pine", "Evergreen", "Yew"]

if let myValue = index {
    print(treeArray[myValue]) // using "index" would throw an error
} else {
    print("Index is nil")
}
// Do note that the lifespan(scope) of the constant "myValue" is the conditional statement that it pertains to. myValue cannot be referenced outside of the optional binding.
// Optional binding can be used to unwrap multiple optionals at the same time:

var pet1: String?
var pet2: String?
var pet3: String?
var petCount: Int = 3

pet1 = "Pitbull"
pet2 = "Daschund"
pet3 = "German Sheperd"

if let firstPet = pet1, let secondPet = pet2, let thirdPet = pet3{
    print(firstPet)
    print(secondPet)
    print(thirdPet)
} else {
    print("Pet(s) could not be found")
}

// A boolean clause can be added to the optional binding as well

if let firstPet = pet1, let secondPet = pet2, let thirdPet = pet3, petCount > 3{
    print(firstPet)
    print(secondPet)
    print(thirdPet)
} else { //this else clause is executed because petCount is not greater than 3
    print("Pet(s) could not be found")
}

// Optionals can be declared as being implicitly unwrapped. When an optional is declared that way, the underlying value can be accessed without having to perform forced unwrapping or optional binding. An optional is declared as implicitly unwrapped by simply substituting the question mark with an exclamation point "!"

var implicitIndex: Int! // This optional is implicitly unwrapped

implicitIndex = 1

treeArray = ["Oak", "Pine", "Evergreen", "Yew"]

if implicitIndex != nil {
    print(treeArray[implicitIndex])
} else {
    print("index does not contain a value")
}

// In swift, it is not possible to assign a value of nil to a non-optional variable or constant i.e
// var myInt = nil
// let myConstant = nil

// When writing swift code situations will occur where the compiler is unable to identify the specific type of a value. This is often the case when a value of ambiguous or unexpected type is returned from a method or function call. In this situation it may be necessary to let the compiler know the type of value that your code is expecting or requires using the "as" keyword (referred to as type casting)

// There are two different types of casting: upcasting and downcasting. Upcasting is when an object of a given class is cast to one of its superclasses while downcasting does the opposite. Upcasting to a superclass is a guaranteed conversion while downcasting is not guaranteed to be converted safely(downcasting could result in a runtime error). Upcasting is denoted by the syntax "as" while downcasting is "as!"

/* Here is an example of an upcast:
 let myButton : UIButton = UIButton()
 let myControl = myButton as UIControl
 UIControl is the parent class of UIButton
 
 Here is an example of a downcast(error provoking example):
 let myScrollView: UIScrollView = UIScrollView()
 let myTextView = myScrollView as! UITextView
 UITextView is a child class of UIScrollView but this conversion is not possible with downcasting
 */

// A safer approach to downcasting is to perform an optional binding using "as?". If the conversion is performed successfully, an optional value of the specified type is returned, otherwise the optional value will be nil:

/*
if let classB = classA as? UITextView {
    print("type cast to UITextView succeeded")
} else {
    print("type cast to UITextView failed")
}
*/

/* To check if an object is an instance of a given class, you can type check it using a conditional with the "is" keyword

 if myObject is myClass {
    //myObject is an instance of myClass
 }
*/

