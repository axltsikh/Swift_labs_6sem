import Foundation
enum Months: Int{
    case january=0,february,march,april,may,june,july,august,september,october,november,december;
    func getSeason(_ month:Int) -> String{
        if month == 11 || month==1 || month == 2{
            return "Winter"
        }else if(month > 2 && month < 6){
            return "Spring"
        }else if(month > 5 && month < 9){
            return "Summer"
        }else{
            return "Autumn"
        }
    }
}

var january = Months.january;
var august = Months.init(rawValue: 7)
print(january.getSeason(january.rawValue))
print(january.getSeason(august!.rawValue))
print(january.rawValue)

indirect enum ArithmeticExpression{
    case number(Int)
    case addition(ArithmeticExpression,ArithmeticExpression)
    case substraction(ArithmeticExpression,ArithmeticExpression)
    case division(ArithmeticExpression,ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression)
    case exponentiation(ArithmeticExpression,ArithmeticExpression)
    func evaluate(expression: ArithmeticExpression? =  nil ) -> Int{
            let expression = (expression == nil ? self : expression)
            switch expression! {
                case .number( let value ):
                    return value
                case .addition( let valueLeft, let valueRight ):
                    return self.evaluate( expression: valueLeft ) + self.evaluate( expression: valueRight )
                case .substraction( let valueLeft, let valueRight ):
                    return self.evaluate( expression: valueLeft ) - self.evaluate( expression: valueRight )
                case .division(let valueLeft,let valueRight):
                    return self.evaluate(expression: valueLeft) / self.evaluate(expression: valueRight)
                case .multiplication(let valueLeft,let valueRight):
                    return self.evaluate(expression: valueLeft) * self.evaluate(expression: valueRight)
                case .exponentiation(let valueLeft,let valueRight):
                    return Int(pow(Double(self.evaluate(expression: valueLeft)), Double(self.evaluate(expression: valueRight))))
        }
    }
}


var addition = ArithmeticExpression.addition(.number(20),.number(50))
print(addition.evaluate())
addition = ArithmeticExpression.substraction(.number(20),.exponentiation(.number(5),.number(15)))
print(addition.evaluate())


//class
class Bug{
    var id:Int
    var summary:String 
    var stepsToReproduce: [String]?
    var reporter:String
    var date:Date
    var severity: Severity
    var priority: Priority
    var assignee:String 
    var status: Status
    var fixVerison: String?
    init(id: Int, summary: String, reporter: String, date: Date, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]? = nil,observedProperty:Int) {
            self.id = id
            self.summary = summary
            self.stepsToReproduce = stepsToReproduce
            self.reporter = reporter
            self.date = date
            self.severity = severity
            self.priority = priority
            self.assignee = assignee
            self.status = status
            self.fixVerison = fixVerison
            self.observedProperty = observedProperty
    }

    func changePriority(priority: Priority){
        self.priority = priority
    }
    func setAssignee(assign:String){
        self.assignee=assign
    }
    func resolveBug(){
        self.status = Status.resolved   
    }
    subscript(stepNumber: Int) -> String?{
        get{
            if(stepNumber<stepsToReproduce!.count){
                return stepsToReproduce![stepNumber]
            }
            return nil
        }
    }
    lazy var lazyProperty = "Lazy property value"
    var observedProperty: Int{
        willSet(newValue){
            print("observedProperty изменило значение")
        }didSet(oldValue){
            print("Замененное значение: " + String(oldValue))
        }
    }
}


enum Severity: String {
    case high
    case medium
    case low
}

enum Priority: String {
    case blocker
    case critical
    case major
    case minor
}

enum Status: String {
    case open
    case closed
    case resolved
    case reopened
    case inProgress
}

let bug = Bug(id: 1, summary: "Bug summary", reporter: "John Doe", date: Date(), severity: .high,
             priority: .critical, assignee: "", status: .open, fixVerison: nil, stepsToReproduce: ["Step 1", "Step 2", "Step 3"],observedProperty:15)


bug.observedProperty = 25
print(bug.lazyProperty)
print(bug.priority)
print(bug.status)
print(bug.assignee)

bug.setAssignee(assign: "new assignee")
bug.changePriority(priority: Priority.minor)
bug.resolveBug()
print(bug.priority)
print(bug.status)
print(bug.assignee)
print(bug[1])
print(bug[2])
print(bug[5] ?? nil)