import Foundation

extension Int {
    func isEven() -> Bool{
        if(self%2==0){
            return true
        }else{
            return false
        }
    }
    subscript(number:Int) -> Int{
        var counter:Int = 0;
        for a in String(self){
            if(String(a) == String(number)){
                counter+=1;
            }
        }
        return counter;
    }
}
let a = 5
print(a.isEven())
print(155[5])
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
            self.init(id: 1, summary: "", reporter: "Иванов А.А.",
             date: "20.04.2023", severity: sev, priority: prior, assignee: "Исполнитель", status: stat, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)

    }
    init?(id:Int,sev:Severity,prior:Priority,stat:Status){
        if(id<0){
            return nil
        }
        self.id = id
        self.summary = ""
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
extension Bug{
    convenience init (prior:Priority,stat:Status){
            self.init(id: 1, summary: "", reporter: "Иванов А.А.",
             date: "20.04.2023", severity: Severity.high, priority: prior, assignee: "Исполнитель", status: stat, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
    }
    func getDays() ->Int {
        if self.status != .closed {
            let endOfSentence = self.date.firstIndex(of: "0")!
            let sub = self.date[...endOfSentence]
            let buf = Int(sub) ?? 0
            return 28 - buf
        }
        return 0
    } 
    func reopenBug(){
        self.status = Status.reopened
        self.date = "28"
    }
}
let bug = Bug(prior: Priority.critical,stat: Status.open)
print(String(bug.getDays()))

protocol BugTracker {
    var bugs:[Bug] {get set}
    func createBug(id: Int, summary: String, reporter: String, date: String, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]?,observedProperty:Int)
    func setAssignee(assign:String,index:Int)
    func changeStatus(index:Int)
    func sortBugs()->[Bug]
}
extension BugTracker{
    func createReport(index: Int)->String{
        return "ID: " + String(bugs[index].id) + " Summary: " + String(bugs[index].summary) + " Reporter: " + String(bugs[index].reporter) + " Date: " + String(bugs[index].date) + " Assign: " + String(bugs[index].assignee)
    }
}
class JIRA:BugTracker{
    var bugs = [Bug]()
    func createBug(id: Int, summary: String, reporter: String, date: String, severity: Severity, priority: Priority, assignee: String, status: Status, fixVerison: String?, stepsToReproduce: [String]?,observedProperty:Int){
        bugs.append(Bug(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, fixVerison: fixVerison, stepsToReproduce: stepsToReproduce,observedProperty:observedProperty))
    }
    func setAssignee(assign:String,index:Int){
        bugs[index].assignee=assign
    }
    func changeStatus(index:Int){
        bugs[index].status = Status.resolved   
    }
    func sortBugs() -> [Bug] {
        return bugs.sorted {
            $0.priority.rawValue > $1.priority.rawValue
        }
    }
}

var jira = JIRA();
jira.createBug(id: 1, summary: "first", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
jira.createBug(id: 2, summary: "second", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.minor, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
jira.createBug(id: 3, summary: "third", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
jira.createBug(id: 4, summary: "fourth", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.major, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)

print(jira.createReport(index:2))
jira.setAssignee(assign: "newAssigne",index: 2)
jira.changeStatus(index:2)
print(jira.createReport(index:2))
var sorted = jira.sortBugs();
for c in sorted{
    print(c.priority)
}