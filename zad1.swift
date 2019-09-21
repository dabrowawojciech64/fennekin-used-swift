import Foundation

class CheckListElement : CustomStringConvertible {
    let task: String
    var done: Bool
    init() {
        self.task="To do"
        self.done=false

    }
    init(task: String, done: Bool) {
        self.task = task
        self.done = done
    }
    var description: String 
    {
        var description = ""
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
var test2 = CheckListElement(task: "Zrobić pierwsze zadanie", done: true)
print(test2)
