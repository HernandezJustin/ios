import UIKit


//Heres an example of a class in swift named NewClassName from which the new class is derived from
class NewClassName {
    //properties
    //instance methods
    //type methods
}

//The properties section of the declaration defines the variables and constants that are to be contained within the class. The instance methods and type method sections define the methods that are available to be called on the class and instances of the class. These are essentially functions specific to the class that perform a particular operation when called upon.

//A key goal of OOP is a concept referred to as data encapsulation. The idea behind data encapsulation is that data should be stored within classes and accesed only through methods defined in that class. Data encapsulated in a class are referred to as properties or instance variables.

class Enemy {
    var health: Float = 100
    var attackPower: Float = 13
    var name: String = "Goblin"
    var weight: Float = 120
    
    //This movementSpeed property is a computed property because it is set up using a get and set method. The get method returns the associated computation for movement speed. The set method sets the movementDebuff and calulates the value for the properties that depend on its computation. Notice that we compute a movement debuff by adding 30 to the value of the weight property. Inversely, on setting a movement debuff value, we can calculate the corresponding enemy weight by doing the inverse calculation(subtracting 30 from the debuff value)
    var movementDebuff: Float {
        get{
            return weight + 30
        }
        set(newMovementDebuff){
            weight = newMovementDebuff - 30
        }
    }
    
    //displayHealth is an instance method. Only upon creating an enemy object will this method have the ability to be used. The other type of method is called a type method which operate at the level of the class, such as creating a new instance of a class.
    func displayHealth(){
        print("\(name) has \(health) health")
    }
    
    class func maxHealth() -> Float {
        return 2000
    }
    
    //Like many OOP languages, swift has the ability to use the self keyword which indicates that the method or property belongs to the current class instance(Instead of writing Enemy.health, it is more practical to use self)
    func takePoisonDamage() {
        self.health -= 5
    }
    
    //Lets work with the init method which will be responsible for setting custom property values for our future class instances. When the init method is created, instances of the class must be initialized with the init method params.
    init(enemyHP: Float, enemyAttackPower: Float, enemyName: String){
        health = enemyHP
        attackPower = enemyAttackPower
        name = enemyName
    }
    
    //Conversely, any cleanup tasks that need to be performed before a class instance is destroyed by the swift runtime system can be performed by implementing a deinitializer within the class:
    deinit {
        //clean up code goes here
    }
    
}
//This is a type method because it is called within the class and does not rely on instances of the class to execute
print(Enemy.maxHealth())

//Lets create an instance of this enemy class:
var enemy1: Enemy = Enemy(enemyHP: 120, enemyAttackPower: 3, enemyName: "Skeleton")

//This creates an instance of our enemy class in an object whose reference is enemy1. That being said, we can call that instance method that we created earlier on our newly created object

print(enemy1.name)
print(enemy1.movementDebuff)
enemy1.movementDebuff = 300
print(enemy1.weight)
enemy1.displayHealth()
enemy1.takePoisonDamage()
enemy1.displayHealth()

//Class properties in swift fall into two categories referred to as stored properties and calculated properties. Stored properties are those values that are contained within a constant or a variable. A calculated property is a value that is derived based on some form of calculation or logic at the point at which the porperty is set or retrieved. Computed properties are implemented by creating getter and optional corresponding setter methods to perform the computation. In our enemy class, the health, attack power, and name and weight properties are stored.







