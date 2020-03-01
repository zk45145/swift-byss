enum Days { case Poniedziałek, Wtorek, Środa, Czwartek, Piątek, Sobota, Niedziela }

class CheckListElement: CustomStringConvertible {

    let textField: String
    var status: Bool
    let dayOfWeek: Days
    
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
}