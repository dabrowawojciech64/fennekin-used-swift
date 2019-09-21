import Foundation

enum Dayoftheweek : String {
	case Pon = "Poniedziałek", Wto = "Wtorek", Sro = "Środa", Czw = "Czwartek", Pia = "Piątek", Sob = "Sobota", Nie = "Niedziela",Wrn
}
protocol IsDoable{
    var done: Bool { get set }
}

protocol CheckListDelegate : CheckList {
    func displayList()
}


class CheckListElement : CustomStringConvertible, IsDoable {
    let day: Dayoftheweek
    let task: String
    var done: Bool
    weak var delegate:CheckListDelegate?
    init() {
        self.day = .Wrn
        self.task = "To do"
        self.done = false
        
    }
    init( day: Dayoftheweek, task: String ) {
        self.day = day
        self.task = task
        self.done = false
    }
    func toggleDone( toggle: Bool) {
        if toggle {
            self.done = !self.done
        }
        delegate?.displayList()
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
class CheckList : CheckListDelegate{
    var elements : [CheckListElement]
    init(initialElements: [CheckListElement]) {
        self.elements = [ CheckListElement ]()
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
    func displayEvery3rd(){
        for index in 0...self.elements.count{
            if(index % 3 == 2){
                print("\(elements[index].description)")
           }
        }
        print("/////////////////////////////////")
    }


}
var tablicaZadan = [CheckListElement]()
for i in 1...10{
    tablicaZadan.append( CheckListElement( day: .Pon, task: "Testowy element nr \(i) " ) )
}
var lista = CheckList( initialElements: tablicaZadan )
tablicaZadan[2].toggleDone(toggle: true)
lista.elements[8].toggleDone(toggle: true)
lista.displayEvery3rd()
