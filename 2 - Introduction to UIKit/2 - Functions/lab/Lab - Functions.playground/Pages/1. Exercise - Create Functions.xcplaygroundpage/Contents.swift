/*:
 ## Exercise - Create Functions
 
 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself()
{
    print("Developer, Kaan Baylas")
}
introduceMyself()
/*:
 Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
 */
func magicEightBall()
{
    let randomNum = Int.random(in: 0...4)
    
    switch randomNum {
    case 0:
        print("Cannot predict now.")
    case 1:
        print("Don't count on it.")
    case 2:
        print("Ask again later.")
    case 3:
        print("Without a doubt!")
    case 4:
        print("Most likely")
    default:
        print("Something is wrong with the magic eight ball...")
    }
}

magicEightBall()
//: page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
