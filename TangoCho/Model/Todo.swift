//
//  Todo.swift
//  TangoCho
//
//  Created by higuchiryunosuke on 2020/01/10.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var title = ""
    @objc dynamic var meaning = ""
}
