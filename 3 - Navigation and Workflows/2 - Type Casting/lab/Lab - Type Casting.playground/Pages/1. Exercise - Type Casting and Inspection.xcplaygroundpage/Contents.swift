/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var items : [Any] = [5.6, 2.4, 7.2, 2, 12, 15, 146, "Kaan", "Baylas", "Developer", true, false]
print(items)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for item in items
{
    if let integer = item as? Int
    {
        print("The integer has a value of \(integer)")
    }
    else if let double = item as? Double
    {
        print("The double has a value of \(double)")
    }
    else if let string = item as? String
    {
        print("The string has value of \(string)")
    }
    else if let boolean = item as? Bool
    {
        print("The boolean has a value of \(boolean)")
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
var newItems : [String: Any] = ["One": 1, "Two": 22.22, "Three": "Dont know", "Four": false]
print(newItems)
/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0

for (_, value) in newItems
{
    if let value = value as? Int
    {
        total += Double(value)
    }
    else if let value = value as? Double
    {
        total += value
    }
    else if let value = value as? Bool
    {
        if value
        {
            total += 2
        }
        else
        {
            total -= 3
        }
    }
    else if let _ = value as? String
    {
        total += 1
    }
}
print(total)
//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
