//
//  MockDataService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/17/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Foundation
import SugarRecord
@testable import AwesomeWeather

class MockDataService: DataService {

    var removeWasCalled = false

    var array: [Any]! = []

    func fetch<T>() -> [T] where T: Entity {
        return array as! [T]
    }

    func fetchFiltered<T>(with: String, equalTo: String) -> [T] where T: Entity {
        return array as! [T]
    }

    func insert<T>(entity: T) where T: Entity {
        array.append(T)
    }

    func insert<T>(entities: [T]) where T: Entity {
        array.append(entities)
    }

    func remove<T>(entity: T) where T: Entity {

    }

    func remove<T>(entities: [T]) where T: Entity {
        removeWasCalled = true
    }

    func create<T>() -> T where T: Entity {
        return create()
    }
}
