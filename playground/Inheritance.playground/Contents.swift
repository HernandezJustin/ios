import UIKit

//Inheritance:

//The concept of inheritance brings something of a real-world view to programming. It allows a class to be defined that has a certain set of characteristics(such as methods and properties) and then other classes to be created which are derived from that class. The derived class inherits all of the features of the parent class and typically then adds some features of its own. Classes dont have to be derived from a root class. A subclass can inherit from another subclass. In swift, a subclass can only be derived from a single direct parent class(single inheritance)

//To show an example of inheritance, we will create a subclass of a bank account class called savings account. The savings account will inherit all methods and properties of the bank account plus the ability to add more/different functionality

class BankAccount {
    var accountBalance: Float
    var accountNumber: Int
    
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    func displayBalance() {
        print("number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}

class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    override func displayBalance() {
        super.displayBalance()
        //A call to the parent "super" displayBalance method allows us to reuse its code in the override method. This allows the omission of the following two lines of code:
        //print("number \(accountNumber)")
        //print("Current balance is \(accountBalance)")
        print("Prevailing interest rate is \(interestRate)")
    }
    
    init(number: Int, balance: Float, rate: Float) {
        interestRate = rate
        //this super init line refers to the parent class init method so like the above super call, this allows us to omit redundant code
        super.init(number: number, balance: balance)
    }
}
//SavingsAccount is a subclass of BankAccount so vice versa, BankAccount is the parent of SavingsAccount. In the above code, we extend the functionality of the subclass by adding the interest rate property and calculate interest method. The extended functionalities cannot be used or accessed in any instance of the parent class.

//When using inheritance it is not unuasual to find a method in the parent class that almost does what you need, but requires modification to provide the precise functionality you require. One way to go about this scenario is creating a new method with an entirely different name. The better option involves overriding the inherited method and writing a new version of it in the subclass. When overriding a method, you must make sure that it is created by following these rules: Firstly, The overriding method must take exaxctly the same number and type of parameters as the corresponding parent method. Secondly the new method must have a same return as the parent. Finally, the override method and its parent should both share the same name.

//Another way to add new functionality to a swift class is to use an extension. Extensions can be used to add features such as methods, initializers, computed properties and subscripts to an existing class without the need to create and reference a subclass. 

extension Double {
    var squared: Double {
        return self * self
    }
        
    var cubed: Double {
        return self * self * self
    }
}

//We are going to extend the functionality of the Double class by adding these computed properties to it. This will allow us to delare any double and use the newly created computed properties by calling them like methods of a double

let myValue: Double = 3.0
print(myValue.squared)

//extentions gotchas: are that they cant contain stored properties or override the existing functionality of a class.



