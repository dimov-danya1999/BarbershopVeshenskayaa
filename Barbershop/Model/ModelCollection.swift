
import Foundation
import UIKit

struct ModelCollection {
    var imagePhoto : UIImage?
    
    init(imagePhoto: String) {
        self.imagePhoto = UIImage(named: imagePhoto)
    }
    static var newPhoto =  [
        ModelCollection(imagePhoto: "1"),
        ModelCollection(imagePhoto: "2"),
        ModelCollection(imagePhoto: "3"),
        ModelCollection(imagePhoto: "4"),
        ModelCollection(imagePhoto: "5"),
        ModelCollection(imagePhoto: "6")
    ]
    
}


