import UIKit

// MARK: OBJECTIVES
/*
 *created a generic function
 * create a stack using a generic function
 *stack: using a generic type
 inout function
 generic , generic function
 stack: generic type
 */


// an in out function
// when writing a function
// that should be in-place means our function should be inout function ***
func swapTwoInts(int1: inout Int, int2: inout Int){
   // keyword is: INOUT means you can change the variables outside of the scope of the function
    // when writing function that manipulates something. Change the variable outside of the scope
    
    let temp = int1 // you capture it to avoid it from being overridden
    // need to capture the value because you will lose the value.
    int1 = int2
    int2 = temp

}

var num1 = 4
var num2 = 13

print("values of ints before swap is \(num1) \(num2)")
swapTwoInts(int1: &num1, int2: &num2)
print("values of ints AFTER swap is \(num1) \(num2)")
// cannot change without denoating the function as inOut and then making a reference
//The function has the ability to change the two variable.. It becomes like this because the original function was declared inout. because of the refrence


func swapTwoString(){
    
    
}

// with generics you can write a function that will do the action regarless of type

// GENERIC FUNCTION: The generic types need to be the same
// T is for type
// E is for element
func swapTwoValues<T>(value1: inout T, value2: inout T){
    
    let temp = value1
    
    value1 = value2
    value2 = temp
}

var name1 = "Ready"
var name2 = "Action"

print("BEFORE the swap the values are \(name1) \(name2)")

swapTwoValues(value1: &name1, value2: &name2)

print("Values of swap AFTER \(name1) \(name2)")


// implement a generic stack using an array

struct IntStack{
    // this will only work on type ints
    private var elements = [Int]()
}

// this is a generic type
struct Stack<T> {
    private var elements = [T]() // works with anytype. if you start with it being a certain type you NEED to stay with the same type. This allows you to just reuse the function in the case of anytype so you dont have to rewrite it based on the type.
    
    public var peek: T? {
        // returning last element added...
        return elements.last
    }
    
    public mutating func push(item: T) {
        
        elements.append(item)
    }
    
    public mutating func pop() ->T? {
        // the type is optional because it can be empty.
        guard !elements.isEmpty else{
            // this guard against it being empty
            return nil
        }
        return elements.removeLast()
    }
}

var cohort = Stack<Double>()
cohort.push(item: 1.0)
cohort.push(item: 2.0)
cohort.push(item: 3.0)
cohort.push(item: 4.0)
cohort.push(item: 5.0)
cohort.push(item: 6.3)

print(cohort.peek) // 6.3

cohort.pop()
cohort.pop()

print(cohort.peek)// 4.0

struct Fellow {
    let name: String
    let language: String
}


let ameni = Fellow(name: "Ameni", language: "Swift")
let tom = Fellow(name: "Tom", language: "Swift")

var  fellows = Stack<Fellow>()
fellows.push(item: tom)
print(fellows) // ["Tom"]

