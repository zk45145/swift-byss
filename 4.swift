protocol Feasible {
    var status: Bool { get }
}

protocol CheckListDelegate {
    func printAllElements ()
}

enum Days { case Poniedziałek, Wtorek, Środa, Czwartek, Piątek, Sobota, Niedziela }

class CheckListElement: CustomStringConvertible, Feasible {
    let textField: String
    var status: Bool
    let dayOfWeek: Days
    var delegate: CheckListDelegate?
    
    init (textField: String, status: Bool, dayOfWeek: Days) {
        self.textField = textField
        self.status = status
        self.dayOfWeek = dayOfWeek
    }
    
    init () {
        self.textField = ""
        self.status = false
        self.dayOfWeek = .Poniedziałek
    }
    
    var description: String {
        if !(status) { return "\(dayOfWeek) \(textField) -> Do Wykonania"}
        else { return "\(dayOfWeek) \(textField) -> Gotowe"}
    }
    
    func changeStatus (status: Bool) {
        self.status = status
        delegate?.printAllElements()
    }
}

class CheckList: CheckListDelegate {
    var data: Array <CheckListElement> 
    
    init (data: Array <CheckListElement>) {
        self.data = data
    }
    
    func printAllElements () {
        for item in data {
            print (item)
        }
    }
}