import Foundation
class Bug{
    var id:Int
    var summary:String 
    var stepsToReproduce: [String]?
    var reporter:String
    var date:String
    var severity: Severity
    var priority: Priority
    var assignee:String 
    var status: Status
    var fixVerison: String?
    init(id: Int, summary: String, reporter: String, date: String, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]? = nil,observedProperty:Int) {
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
    convenience init(sev:Severity,prior:Priority,stat:Status){
            self.init(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",
             date: "20.04.2023", severity: sev, priority: prior, assignee: "Исполнитель", status: stat, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
    }
    init?(id:Int,sev:Severity,prior:Priority,stat:Status){
        if(id<0){
            return nil
        }
        self.id = id
        self.summary = "Bug, созданный вспомогательным инициализатором"
        self.stepsToReproduce = ["Шаг1","Шаг 2","Шаг 3"]
        self.reporter = "Иванов А.А."
        self.date = "20.04.2023"
        self.severity = sev
        self.priority = prior
        self.assignee = "Исполнитель"
        self.status = stat
        self.fixVerison = "1.42"
        self.observedProperty = 14
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

class FunctionalBug: Bug{
    var buggedFunctional:String
    init(id: Int, summary: String, reporter: String, date: String, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]? = nil,observedProperty:Int,bugged:String) {
            self.buggedFunctional = bugged
            super.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, fixVerison: fixVerison, stepsToReproduce: stepsToReproduce,observedProperty:observedProperty)
    }
}

class VisualBug:Bug{
    var buggedElement:String
    init(id: Int, summary: String, reporter: String, date: String, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]? = nil,observedProperty:Int,bugged:String) {
            self.buggedElement = bugged
            super.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, fixVerison: fixVerison, stepsToReproduce: stepsToReproduce,observedProperty:observedProperty)
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

let bug = Bug( sev: Severity.high,
             prior: Priority.critical, stat: Status.open)

print(bug.id)
print(bug.summary)
print(bug.severity) 


let failedBug = Bug(id:15, sev: Severity.high,
             prior: Priority.critical, stat: Status.open)
print(failedBug!.id)

let visualBug = VisualBug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15,bugged: "Dialog")
let functionalBug = FunctionalBug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15,bugged: "Func")

let secondvisualBug = VisualBug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15,bugged: "SecondDialog")
let secondfunctionalBug = FunctionalBug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15,bugged: "SecondFunc")
let thirdvisualBug = VisualBug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15,bugged: "ThirdDialog")


var bugs = [Any]()
bugs.append(visualBug)
bugs.append(functionalBug)
bugs.append(secondvisualBug)
bugs.append(secondfunctionalBug)
bugs.append(thirdvisualBug)
var FunctionalBugs = [FunctionalBug]()
var VisualBugs = [VisualBug]()
for a in bugs{
    if(a is FunctionalBug){
        FunctionalBugs.append(a as! FunctionalBug)
    }else{
        VisualBugs.append(a as! VisualBug)
    }
}

print(VisualBugs.count);
print(FunctionalBugs.count)