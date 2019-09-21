import Foundation

enum Dayoftheweek: String {
	case Pon = "Poniedziałek", Wto = "Wtorek", Sro = "Środa", Czw = "Czwartek", Pia = "Piątek", Sob = "Sobota", Nie = "Niedziela",Wrn
}
protocol IsDoable{
    var done: Bool { get set }
}

protocol CheckListDelegate: CheckList {
    func displayList()
}


class CheckListElement: CustomStringConvertible, IsDoable {
    let day: Dayoftheweek
    let task: String
    var done: Bool
    weak var delegate: CheckListDelegate!
    init() {
        self.day = .Wrn
        self.task = "To do"
        self.done = false
        
    }

    init(day: Dayoftheweek, task: String) {
        self.day = day
        self.task = task
        self.done = false
    }

    func toggleDone(toggle: Bool) {
        if toggle {
            self.done = !self.done
        }
        delegate.displayList()
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
class CheckList: CheckListDelegate{
    var elements: [CheckListElement]

    init(initialElements: [CheckListElement]) {
        self.elements = [CheckListElement]()
        for item in initialElements {
            item.delegate = self
            self.elements.append(item)
        }
    }

    func displayList(){
        for element in self.elements {
            print("\(element.description)")
        }
        print("/////////////////////////////////")         
    }


}
var test = CheckListElement()
var test2 = CheckListElement(day: .Sro, task: "Zrobić czwarte zadanie")
var test3 = CheckListElement(day: .Sob, task: "Wpaść na pomysł na obiad")
var lista = CheckList(initialElements: [test, test2, test3])
test2.toggleDone(toggle: true)