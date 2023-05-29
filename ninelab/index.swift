internal class Bug{
    private var id:Int
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

fileprivate struct IssueList<T>{
    var items = [T]()
    mutating func add(item:T){
        items.append(item)
    }
    mutating func remove()->T?{
        return items.popLast();
    }
}
extension IssueList{
    var lastItem: T?{
        return items.last;
    }
}

private var bugs = IssueList<Bug>()
var visualBug = Bug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)
var functionalBug = Bug(id: 1, summary: "Bug, созданный вспомогательным инициализатором", reporter: "Иванов А.А.",date: "20.04.2023", severity: Severity.medium, priority: Priority.critical, assignee: "Исполнитель", status: Status.open, fixVerison: "1.42", stepsToReproduce: ["Шаг1","Шаг 2","Шаг 3"],observedProperty:15)

bugs.add(item: visualBug)
bugs.add(item: functionalBug)
print(bugs.items.count)
print(bugs.remove()!)
print(bugs.items.count)
print(bugs.lastItem!)



protocol IssueStorage{
    associatedtype Item
    mutating func addItem(item:Item)
    mutating func removeItem()->Item?
    var items:[Item]{get set}
}
class BugStorage:IssueStorage{
    func addItem(item:Bug){
        items.append(item)
    }
    func removeItem()->Bug?{
        items.popLast()
    }
    var items:[Bug]=[]
}
let storage = BugStorage()
storage.addItem(item:visualBug)
storage.addItem(item:functionalBug)
print(storage.items.count)
print(storage.removeItem())
print(storage.items.count)