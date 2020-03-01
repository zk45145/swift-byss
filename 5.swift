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
    
    func printEveryThirdElement () {
        for (index, item) in data.enumerated() {
            if index%3 == 2 {
                print (item)
            }
        }
    }
}

let a = CheckListElement (textField: "Zrobić pranie", status: false, dayOfWeek: .Poniedziałek)
let b = CheckListElement (textField: "Odkurzyć", status: false, dayOfWeek: .Wtorek)
let c = CheckListElement (textField: "Wynieść śmieci", status: false, dayOfWeek: .Środa)
let d = CheckListElement (textField: "Zrobić zakupy", status: false, dayOfWeek: .Czwartek)
let e = CheckListElement (textField: "Pozmywać", status: false, dayOfWeek: .Piątek)
let f = CheckListElement (textField: "Naprawić szafę", status: false, dayOfWeek: .Sobota)

let elements = [a, b, c, d, e, f]
let list = CheckList (data: elements)

for item in list.data {
    item.delegate = list
}

a.changeStatus(status: true)
print()
list.printEveryThirdElement()