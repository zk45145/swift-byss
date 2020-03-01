class CheckListElement: CustomStringConvertible {

    let textField: String
    var status: Bool
    
    init (textField: String, status: Bool) {
        self.textField = textField
        self.status = status
    }
    
    init () {
        self.textField = ""
        self.status = false
    }
    
    var description: String {
        if !(status) { return "\(textField) -> Do Wykonania"}
        else { return "\(textField) -> Gotowe"}
    }
}