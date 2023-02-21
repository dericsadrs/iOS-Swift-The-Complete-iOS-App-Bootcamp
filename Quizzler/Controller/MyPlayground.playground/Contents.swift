

print("======================================================")
print("Class and Objects Example:")
print("======================================================\n")

// Class
class Dog {

    let dogBreed : String
    let dogName : String

    init(dogBreed : String, dogName : String){
        self.dogBreed = dogBreed
        self.dogName = dogName
    }

}

// Object

let dog1 = Dog (dogBreed : "Aspin", dogName : "Browny")
print("This is my dog \(dog1.dogName), my dog is a \(dog1.dogBreed)")



// Properties and Methods
class Animal {
    var name: String

    init (name: String) {
        self.name = name
    }

    func eat() {
        print("I can eat.")
    }
}

class Cat : Animal {
    func displayName () {
        print("I am \(name)")
    }
}

var object1 = Cat(name: "Bryan the Cat")
object1.displayName()
object1.eat()







print("======================================================")
print("Class Example:")
print("======================================================\n")
// Pass by reference example


// We declare a class, Employee, and create an instance, employee1/ We set the name property of employee1 to Tom.
// We then declare another variable, employee2, and assign employee1 to it. We set the name property of employee2 to Fred and print the names of both Employee instances.
// Because instances of classes are passed by reference, the valie of the name property of both instances equal to Fred.
class Employee{
    var name: String
    
    init (name: String) {
        self.name = name
    }
}

// object
var employee1 = Employee(name: "Tom")
print(employee1.name)

// another object
var employee2 = employee1
employee2.name = "Fred"

print(employee1.name)
print(employee2.name)



print("======================================================")
print("Struct Example:")
print("======================================================\n")


// struct example

// When an instance of a struct is assigned or passed to a function, its value copied.
// A unique instance of the struct is passed instead of a reference to the instance of the struct



// The moment movie1 is assigned to the movie2 variable, a copy of movie1 is made and assigned to movie2.
// The values of movie1 and movie2 have no relation to one another apart from the fact that they are copies
struct Movie{
    var movieName : String
    init(movieName : String)
    {
        self.movieName = movieName
    }
}

var movie1 = Movie(movieName : "Avengers")

var movie2 = movie1
movie2.movieName = "Justice League"

print(movie1.movieName)
print(movie2.movieName)
print(movie1.movieName)
print(movie2.movieName)







print("======================================================")
print("Access Controls:")
print("======================================================\n")

// Public

class Food{
    public var foodType : String //= "ChickenJoy"
    
    init(foodType : String)
    {
        self.foodType = foodType
    }
    public func display()
    {
        print("I am  a \(foodType) \n Please eat me ")
    }
}

//created an object
// access and assign value to public property
var burger = Food(foodType : "Cheese Burger")

// access the public method
burger.display()





// Private
class Student{
    private var name : String = ""

    //initializer
    private func display(){
        print("Hello I'm a student")
    }
    
    public func getName() -> String{
        display()
        return name
    }
    
    public func setName(pName: String)
    {
        self.name = pName
    }
}

var student1 = Student()
student1.setName(pName : "Kath")
print(student1.getName())

// Method overriding - Deric

print("======================================================")
print("Method Overriding:")
print("====================================================\n")

class Vehicle {
    
    // method in parent class
    func displayInfo () {
        print ("Four Wheeler")
    }
}

// motorcycle inherits vehicle
class Motorcycle: Vehicle {
    
    // override displayInfo method
    override func displayInfo () {
        print ("Two Wheeler \n")
    }
}

// create an object
var vehicle1 = Motorcycle ()
vehicle1.displayInfo()


// Method overloading

print("======================================================")
print("Method Overloading:")
print("======================================================\n")

// function with Int parameter
func displayValues (n: Int) {
    print ("This is an integer: \(n)")
}

// function with String parameter
func displayValues (n: String) {
    print ("This is a string: \(n)")
}

// same function name, but different argument
displayValues(n:2)
displayValues(n:"Hello World")

print("======================================================")
print("Generic Function:")
print("======================================================\n")

class Number {
    func sum <T: Numeric> (a: T, b:T) {
        print ("This is the sum of the two numbers: \(type(of: a))", (a+b))
    }
}
 var number1 = Number ()
number1.sum(a:5, b:3) //Int
number1.sum(a:1, b:0.0) //Double



let formatter = NumberFormatter()
formatter.numberStyle = .spellOut
let number = 87654
let spelledOutNumber = formatter.string(for: NSNumber(integerLiteral: number))!
print("\(number) spelled out is \(spelledOutNumber).")










