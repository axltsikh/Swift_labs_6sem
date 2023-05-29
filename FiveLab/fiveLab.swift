func sum(_ numbers: [Double]) -> Double {
    var sum:Double=0;
    for number in numbers{
        sum+=number
    }
    return sum
}
//5.1.1
func sumForNextsTask(_ numbers:Double...) -> Double {
    var sum:Double=0;
    for number in numbers{
        sum+=number
    }
    return sum
}
//5.1.2
func avg(_ numbers: Double...) -> Double{
    return(sum(numbers)/Double(numbers.count))
}
print(avg(15,3,1))  
//5.1.3
func changeSymbol(_ a: inout Int)->Int{
    return (a * (-1))
}
var a = -1
print(changeSymbol(&a))

//5.1.4
func doWithTwo(_ funcToCall: (Double...) -> Double, _ arg1: Double, _ arg2: Double) -> Double{
    return (funcToCall(arg1,arg2))
}
print(doWithTwo(avg,5,1))  
//5.1.5
func operation(_ functionName:String)->(Double...) -> Double{
    if(functionName=="avg"){
        return avg
    }
    else{
        return sumForNextsTask
    }
}
print(operation("avg")(1,3))
print(operation("sum")(15,100))

//5.1.6
func doOperation(_ operation: String) -> ((Double,Double)->Double)? {
    switch operation{
        case "+":
            return{
                (a:Double,b:Double) in a + b
            }
        case "-":
            return{
                (a:Double,b:Double) in a - b
            }
        case "*":
            return{
                (a:Double,b:Double) in a * b
            }
        case "/":
            return{
                (a:Double,b:Double) in a / b
            }
        default:
            return nil
    }
}
let doOperationResult = doOperation("*")!
print(doOperationResult(5,15))

//5.2.1

let numbers = [20,19,25,70,123,52,61]
print(numbers.sorted(by: {
    (a: Int, b:Int) -> Bool in
    return a>b
}))
print(numbers.sorted(by: {
    (a: Int, b:Int) -> Bool in
    return a<b
}))
//5.2.2
let toStringSum = numbers.map{(num) -> String in
    if(num==nil){
        return ""
    }
    var sum = 0
    for number in String(num){
        sum += Int(String(number))!
    }
    return String(sum)
}
print(toStringSum)

//5.2.3
let doubleArray = [[5,6,7],[13,15,16],[65,76,12]]
let convert = doubleArray.flatMap{$0}
print(convert)

//5.2.4
let maxArray = [20,19,25,70,123,52,61]
let findMax = maxArray.reduce(maxArray[0],{(currentMax,value) in
    return max(currentMax,value)
})

print(findMax)