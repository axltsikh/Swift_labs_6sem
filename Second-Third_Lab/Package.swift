//2.1
let firstVariable = 15
var secondVariable = 13
let integerVarable: Int = 12
var stringVarible: String = "String Variable Value"
print(firstVariable)
print(secondVariable)
print(integerVarable)
print(stringVarible)
print(stringVarible + String(firstVariable))
//2.2
var binary = 0b101
var decimal = 5
var hexadecimal = 0x5
var exponential = 0.36e0
let formattedNumber = 00012_305_670.9805
print("Дополнителньное форматирование: \(formattedNumber)")
//2.3
typealias Text=String
let firstTextConstant: Text = "1234"
let secondTextConstant: Text = "345"
let thirdTextConstant: Text = "asdasd1234"
if Int(firstTextConstant) != nil { print(firstTextConstant) }
if Int(secondTextConstant) != nil { print(secondTextConstant) }
if Int(thirdTextConstant) != nil { print(thirdTextConstant) }


var firstTuple=(year: 2019,faculty: "FIT",number: 4)
print("Значения в кортеже: ")
print(firstTuple.year)
print(firstTuple.1)
print(firstTuple.number)
firstTuple.0=2022
firstTuple.faculty="firstfirstTupleFaculty"
firstTuple.number=15
print("Значения в кортеже после изменения: ")
print(firstTuple.year)
print(firstTuple.faculty)
print(firstTuple.number)
let (year,faculty,number)=firstTuple
var secondTuple=(2019,"FIT",4)
firstTuple=secondTuple
print("Первый кортеж после обмена: ")
print(firstTuple.year)
print(firstTuple.faculty)
print(firstTuple.number)

//2.4
var firstString = "123"
var secondString:String?
var optionalInt:Int? = Int(firstString)
print(optionalInt!)

var possibleInteger:Int? = 404
possibleInteger=nil
//2.5
var optionalBundle:String?
if let getValue = optionalBundle{
    print(getValue)
} else{
    print("В строке нет значения")
    }

//2.6
var (x,y,z)=(60,60,60)
print(x)
print(y)
var valueGetter:String
var optionalVariable:String?
valueGetter=optionalVariable ?? "noname"
print(valueGetter)

//2.7
var monthArray = ["January","February","March","April","May","June","July","August","September","October","November","December"]
for i in 0...monthArray.count-1{
    print(monthArray[i])
}
for i in 0..<monthArray.count{
    print(monthArray[i])
}

//2.8
let interpolationConstant = 20
var interpolationVariable = 25
print("\(interpolationConstant) \(interpolationVariable) \(interpolationVariable-interpolationConstant)")
print("Использование специального символа \nпереноса строки")

//2.9
typealias Operation = (operandOne:Float,operandTwo:Float,operation:Character)
var firstOperationTuple:Operation = (5.5,12,"/")
switch firstOperationTuple.operation {
    case "+":
        print("Результат: \(firstOperationTuple.operandOne+firstOperationTuple.operandTwo)")
    case "-":
        print("Результат: \(firstOperationTuple.operandOne-firstOperationTuple.operandTwo)")
    case "*":
        print("Результат: \(firstOperationTuple.operandOne*firstOperationTuple.operandTwo)")
    case "/":
        print("Результат: \(firstOperationTuple.operandOne/firstOperationTuple.operandTwo)")
    default:
        print("Неверная операция")
}

//2.10
var integerArray = [1,2,3,4,5,6,7,8,9,10]
for number in integerArray{
    print(number)
}
var counter=0
while counter<integerArray.count{
    print(integerArray[counter])
    counter+=1
}
counter=0
repeat{
    print(integerArray[counter])
    counter+=1
}while counter < integerArray.count
for i in (0..<integerArray.count).reversed(){
    print(integerArray[i])
}
for i in stride(from:0,through: integerArray.count-1,by:2){
    print(integerArray[i])
}
var value=10
for i in integerArray{
    guard i<9 else{
        print("Выход из цикла")
        break
    }
    print(i)
}



