

import Foundation



struct Movable {
    func move<M: Mover>(mover: M) {
        print("Abstract Movement --> \(mover.description)")
    }
}



protocol Mover {
    var description: String {get}
}

struct Leg: Mover {
    var description: String = "Started Walking"
}
struct Wings: Mover {
    var description: String = "Started Flying"
}
struct Tyres: Mover {
    var description: String = "Started Running"
}
struct Strings: Mover {
    var description: String = "Started Pulling"
}
struct Fins: Mover {
    var description: String = "Started Swiming"
}
struct Jacks: Mover {
    var description: String = "Started Holding"
}


extension Movable {
    func move(mover: Leg) {
        print("Leg Movement --> \(mover.description)")
    }
}




