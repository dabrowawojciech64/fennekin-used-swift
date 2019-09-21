import Foundation

enum Dayoftheweek : String {
	case Pon = "Poniedziałek", Wto = "Wtorek", Sro = "Środa", Czw = "Czwartek", Pia = "Piątek", Sob = "Sobota", Nie = "Niedziela",Wrn
}
class CheckListElement : CustomStringConvertible {
    let day: Dayoftheweek
    let task: String
    var done: Bool
    init() {
        self.day = .Wrn
        self.task = "To do"
        self.done = false
        
    }
    init( day: Dayoftheweek, task: String, done: Bool ) {
        self.day = day
        self.task = task
        self.done = done
    }
    var description: String 
    {
        var description = ""
        switch self.day {
        case .Pon, .Wto, .Sro, .Czw, .Pia, .Sob, .Nie:
            description += "\(self.day.rawValue) "
        case .Wrn:
            description += "DzienTygodnia "
        default:
            fatalError("Unsupported")
        }
        
        description += "\(self.task) => "
        if self.done {
            description += "Zrobione"
        } 
        else {
            description += "Do wykonania"
        }
        return description

    }
}
var test = CheckListElement()
print(test)
var test2 = CheckListElement(day: .Sro, task: "Zrobić pierwsze zadanie", done: true)
print(test2)
