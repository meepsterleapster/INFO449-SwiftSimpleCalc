//: # Welcome to the UW Calculator Playground (Simple Version)
//:
print("Welcome to the UW Calculator Playground")
//: This homework is designed to force you to exercise your knowledge of the Swift programming language. This homework does not involve iOS in any way. It uses the Playground feature of XCode to allow you to interactively write Swift code--the compiler will constantly check your code in the background.
//:
//: In this exercise, you will implement a pair of functions that do some simple mathematical calculations.
//:
//: ## Your tasks
//: You are to implement two `calculate` functions, each of which take `Strings` that must be converted to integer values in order to perform the calculations intended. This is designed to make you comfortable with converting Strings to other values--a common task in mobile applications, when obtaining input from the user--for further processing. One of the functions takes an array of Strings, expecting each "part" of the calculation expression to be each be in its own String (such as "2" "+" "2"), and the second expects a single String containing the entire expression ("2 + 2").
//: 
//: You should make sure your calculate method can handle the following kinds of input:
//: 
//: * `calculate(["2", "+", "2"])`: This should return 2+2, or 4
//: * `calculate(["2", "-", "2"])`: This should return 2-2, or 0
//: * `calculate(["2", "*", "2"])`: This should return 2*2, or 4
//: * `calculate(["2", "/", "2"])`: This should return 2/2, or 1
//: * `calculate(["2", "%", "2"])`: This should return 2%2, or 0
//: 
//: > For those who aren't aware of it, the "%" operator is called the "modulo" operator, and it is the "remainder" result in an integer division that does not divide equally. Thus, `5 % 2` is 1 (5 divided by 2 is 2 remainder 1), `10 % 3` is 1 (10 divided by 3 is 3 remainder 1) and `4 % 2` is 0 (4 divided by 2 is 2 remainder 0).
//: 
//: The `calculate` method also needs to support a few other less-traditional expressions as well:
//: 
//: * `calculate(["1", "2", "3", "4", "5", "count"])`: This should return a count of all the number arguments, which in this case will be 5.
//: * `calculate(["1", "3", "2", "avg"])`: This should return the average of the numbers, which is all of the values added up (1 + 3 + 2) and divided by the number of arguments (3).
//: * `calculate(["5", "fact"])`: This should calculate the factorial of the single number passed in, which is that number multiplied by each number below it. 5-factorial is 5 * 4 * 3 * 2 * 1, or 120.
//: 
//: For this latter set of operations, it is safe to assume that `["count"]` (with no additional arguments) is 0, `["avg"]` is also 0, and `["fact"]` is 0. `["1", "fact"]` should return 1, and `["0", "fact"]` should also return 1. (Yes, 0-factorial is 1. True story.)
//: 
func calculate(_ arg: String) -> Int {
    
    var operation: String = ""
    var tempNum : String = ""
    var nums:[Int] = [];
    var total = 0;
    var argLength = arg.count
    var curIndex = 0;
    for c in arg {
        curIndex+=1;
        if (!c.isNumber && c != " ") {
            operation.append(c);
        }
        else if c.isNumber{
            tempNum.append(c);
            // If we reach end of the string,AND the end of the string is a number, make sure to append the number
            if(curIndex == argLength){
                nums.append(Int(tempNum)!);
                tempNum = "";
            }
        }
        else if tempNum != ""{
            nums.append(Int(tempNum)!);
            tempNum = "";
        }
    }
    switch operation {
    case "+":
        total = nums[0] + nums[1];
    case "-":
        total = nums[0] - nums[1];
    case "/":
        total = nums[0] / nums[1];
    case "*":
        total = nums[0] * nums[1];
    case "%":
        total = nums[0] % nums[1];
    case "count":
        total = nums.count;
    case "avg":
        total = nums.reduce(0, { x, y in
            x + y
        })
        if(nums.count != 0){
            total /= nums.count
        }
    case "fact":
        if(nums.count == 0){
            total = 0;
        }
        else {
            total =  recursiveFac(num: nums[0])
        }
    default:
        total = -1;
    }
    return total;
}



func calculate(_ args: [String]) -> Int {
    var nums: [Int] = [];
    var total:Int = 0;
    var  operation:String = "";
    for string in args {
        if let num = Int(string){
            nums.append(num);
        }
        else {
            operation = string;
        }
    }
        
        //        if(string.count == 1){
        //            let asChar = Character(string)
        //            if(asChar.isNumber){
        //                nums.append(Int(String(asChar))!)
        //            }
        //            else {
        //                operation = string;
        //            }
        //        }
        //    }
        switch operation {
        case "+":
            total = nums[0] + nums[1];
        case "-":
            total = nums[0] - nums[1];
        case "/":
            total = nums[0] / nums[1];
        case "*":
        total = nums[0] * nums[1];
        case "%":
            total = nums[0] % nums[1];
        case "count":
            total = nums.count;
        case "avg":
            total = nums.reduce(0, { x, y in
                x + y
            })
            if(nums.count != 0){
                total /= nums.count
            }
        case "fact":
            if(nums.count == 0){
                total = 0;
            }
            else {
                total =  recursiveFac(num: nums[0])
            }
        default:
            total = -1;
        }
    return total
    }

func recursiveFac (num : Int) -> Int {
    if(num == 0){
        return 1;
    }
    return num * recursiveFac(num: num-1) ;
}
//: Below this are the test expressions/calls to verify if your code is correct.
//:
//: ***DO NOT MODIFY ANYTHING BELOW THIS***
//: -------------------------------------------
//: All of these expressions should return true
//: if you have implemented `calculate()` correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

//: -------------------------------------------
//: These are extra credit tests; they are commented out 
//: so that they do not conflict with you work until you 
//: choose to implement them.
//: Uncomment them to turn them on for evaluation.
//:
//: Implement `calculate([String])` and `calculate(String)` to handle negative numbers. You need only make the tests below pass. (You do not need to worry about "fact"/factorial with negative numbers, for example.)
//:
//: This is worth 1 pt
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
//: Implement `calculate([String])` and `calculate(String)` to use 
//: and return floating-point values. You need only make the tests 
//: below pass. (Factorial of floating-point numbers doesn't make 
//: much sense, either.)
//:
//: Swift *will* allow you to overload based on return types, so 
//: the below functions can co-exist simultaneously with the 
//: Integer-based versions above.
//: 
//: This is worth 1 pt
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
*/
