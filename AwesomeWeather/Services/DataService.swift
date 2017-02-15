
//
//  DataService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/14/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import SugarRecord
import CoreData

protocol DataService {
    var coreDataStorage: CoreDataDefaultStorage { get }
    func fetch<T>() -> [T] where T: Entity
    func insert<T>(entity: T) where T: Entity
    func insert<T>(entities: [T]) where T: Entity
    func remove<T>(entity: T) where T: Entity
    func remove<T>(entities: [T]) where T: Entity
}

class DataServiceImpl: NSObject, DataService {
    
    lazy var coreDataStorage: CoreDataDefaultStorage = {
        let store = CoreDataStore.named("weathers-db")
        let bundle = Bundle(for: DataServiceImpl.classForCoder())
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    } ()

    func fetch<T>() -> [T] where T: Entity {
        let data = try! coreDataStorage.fetch(FetchRequest<T>())
        return data
    }

    func insert<T>(entity: T) where T: Entity {
        try! coreDataStorage.operation { (context, save) -> Void in
            try! context.insert(entity)
            save()
        }
    }

    func insert<T>(entities: [T]) where T: Entity {
        try! coreDataStorage.operation { (context, save) -> Void in
            for entity in entities {
                try! context.insert(entity)
            }
            save()
        }
    }

    func remove<T>(entity: T) where T: Entity {
        try! coreDataStorage.operation { (context, save) -> Void in
            try! context.remove(entity)
            save()
        }
    }

    func remove<T>(entities: [T]) where T: Entity {
        try! coreDataStorage.operation { (context, save) -> Void in
            do {
                try context.remove(entities)
                save()
            } catch {
                // TODO: handle errors as appropriate
                print(error)
            }
        }
    }
}

