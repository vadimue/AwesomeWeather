// MARK: - Mocks generated from file: AwesomeWeather/Modules/WeatherForecast/Services/WeatherDataStoreService.swift at 2017-02-22 09:03:45 +0000

//
//  WeatherDataStoreService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/15/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Cuckoo
@testable import AwesomeWeather

import Foundation

class MockWeatherDataStoreService: WeatherDataStoreService, Cuckoo.Mock {
    typealias MocksType = WeatherDataStoreService
    typealias Stubbing = __StubbingProxy_WeatherDataStoreService
    typealias Verification = __VerificationProxy_WeatherDataStoreService
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherDataStoreService?
    
    func spy(on victim: WeatherDataStoreService) -> Self {
        observed = victim
        return self
    }
    
    func saveWeatherResponse(weatherResponse: WeatherResponse) {
        return manager.call("saveWeatherResponse(weatherResponse: WeatherResponse)", parameters: (weatherResponse), original: observed.map { o in return { (weatherResponse: WeatherResponse) in o.saveWeatherResponse(weatherResponse: weatherResponse) } })
    }
    
    func remove(entities: [WeatherDetailsData]) {
        return manager.call("remove(entities: [WeatherDetailsData])", parameters: (entities), original: observed.map { o in return { (entities: [WeatherDetailsData]) in o.remove(entities: entities) } })
    }
    
    func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData] {
        return manager.call("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", parameters: (with, equalTo), original: observed.map { o in return { (with: String, equalTo: String) -> [WeatherDetailsData] in o.fetchFiltered(with: with, equalTo: equalTo) } })
    }
    
    struct __StubbingProxy_WeatherDataStoreService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func saveWeatherResponse<M1: Cuckoo.Matchable>(weatherResponse: M1) -> Cuckoo.StubNoReturnFunction<(WeatherResponse)> where M1.MatchedType == WeatherResponse {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse)>] = [wrap(matchable: weatherResponse) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("saveWeatherResponse(weatherResponse: WeatherResponse)", parameterMatchers: matchers))
        }
        
        func remove<M1: Cuckoo.Matchable>(entities: M1) -> Cuckoo.StubNoReturnFunction<([WeatherDetailsData])> where M1.MatchedType == [WeatherDetailsData] {
            let matchers: [Cuckoo.ParameterMatcher<([WeatherDetailsData])>] = [wrap(matchable: entities) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("remove(entities: [WeatherDetailsData])", parameterMatchers: matchers))
        }
        
        func fetchFiltered<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with: M1, equalTo: M2) -> Cuckoo.StubFunction<(String, String), [WeatherDetailsData]> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: with) { $0.0 }, wrap(matchable: equalTo) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherDataStoreService: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func saveWeatherResponse<M1: Cuckoo.Matchable>(weatherResponse: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherResponse {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse)>] = [wrap(matchable: weatherResponse) { $0 }]
            return manager.verify("saveWeatherResponse(weatherResponse: WeatherResponse)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func remove<M1: Cuckoo.Matchable>(entities: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [WeatherDetailsData] {
            let matchers: [Cuckoo.ParameterMatcher<([WeatherDetailsData])>] = [wrap(matchable: entities) { $0 }]
            return manager.verify("remove(entities: [WeatherDetailsData])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func fetchFiltered<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with: M1, equalTo: M2) -> Cuckoo.__DoNotUse<[WeatherDetailsData]> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: with) { $0.0 }, wrap(matchable: equalTo) { $0.1 }]
            return manager.verify("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherDataStoreServiceStub: WeatherDataStoreService {
    
    func saveWeatherResponse(weatherResponse: WeatherResponse) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func remove(entities: [WeatherDetailsData]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData] {
        return DefaultValueRegistry.defaultValue(for: ([WeatherDetailsData]).self)
    }
}

class MockWeatherDataStoreServiceImpl: WeatherDataStoreServiceImpl, Cuckoo.Mock {
    typealias MocksType = WeatherDataStoreServiceImpl
    typealias Stubbing = __StubbingProxy_WeatherDataStoreServiceImpl
    typealias Verification = __VerificationProxy_WeatherDataStoreServiceImpl
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherDataStoreServiceImpl?
    
    func spy(on victim: WeatherDataStoreServiceImpl) -> Self {
        observed = victim
        return self
    }
    
    override var dataService: DataService! {
        get {
            return manager.getter("dataService", original: observed.map { o in return { () -> DataService! in o.dataService } })
        }
        set {
            manager.setter("dataService", value: newValue, original: observed != nil ? { self.observed?.dataService = $0 } : nil)
        }
    }
    
    override var weatherMapper: WeatherMappable! {
        get {
            return manager.getter("weatherMapper", original: observed.map { o in return { () -> WeatherMappable! in o.weatherMapper } })
        }
        set {
            manager.setter("weatherMapper", value: newValue, original: observed != nil ? { self.observed?.weatherMapper = $0 } : nil)
        }
    }
    
    override var city: String? {
        get {
            return manager.getter("city", original: observed.map { o in return { () -> String? in o.city } })
        }
        set {
            manager.setter("city", value: newValue, original: observed != nil ? { self.observed?.city = $0 } : nil)
        }
    }
    
    override func saveWeatherResponse(weatherResponse: WeatherResponse) {
        return manager.call("saveWeatherResponse(weatherResponse: WeatherResponse)", parameters: (weatherResponse), original: observed.map { o in return { (weatherResponse: WeatherResponse) in o.saveWeatherResponse(weatherResponse: weatherResponse) } })
    }
    
    override func remove(entities: [WeatherDetailsData]) {
        return manager.call("remove(entities: [WeatherDetailsData])", parameters: (entities), original: observed.map { o in return { (entities: [WeatherDetailsData]) in o.remove(entities: entities) } })
    }
    
    override func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData] {
        return manager.call("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", parameters: (with, equalTo), original: observed.map { o in return { (with: String, equalTo: String) -> [WeatherDetailsData] in o.fetchFiltered(with: with, equalTo: equalTo) } })
    }
    
    struct __StubbingProxy_WeatherDataStoreServiceImpl: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var dataService: Cuckoo.ToBeStubbedProperty<DataService?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "dataService")
        }
        
        var weatherMapper: Cuckoo.ToBeStubbedProperty<WeatherMappable?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "weatherMapper")
        }
        
        var city: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "city")
        }
        
        func saveWeatherResponse<M1: Cuckoo.Matchable>(weatherResponse: M1) -> Cuckoo.StubNoReturnFunction<(WeatherResponse)> where M1.MatchedType == WeatherResponse {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse)>] = [wrap(matchable: weatherResponse) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("saveWeatherResponse(weatherResponse: WeatherResponse)", parameterMatchers: matchers))
        }
        
        func remove<M1: Cuckoo.Matchable>(entities: M1) -> Cuckoo.StubNoReturnFunction<([WeatherDetailsData])> where M1.MatchedType == [WeatherDetailsData] {
            let matchers: [Cuckoo.ParameterMatcher<([WeatherDetailsData])>] = [wrap(matchable: entities) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("remove(entities: [WeatherDetailsData])", parameterMatchers: matchers))
        }
        
        func fetchFiltered<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with: M1, equalTo: M2) -> Cuckoo.StubFunction<(String, String), [WeatherDetailsData]> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: with) { $0.0 }, wrap(matchable: equalTo) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherDataStoreServiceImpl: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var dataService: Cuckoo.VerifyProperty<DataService?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "dataService", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var weatherMapper: Cuckoo.VerifyProperty<WeatherMappable?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "weatherMapper", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var city: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "city", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func saveWeatherResponse<M1: Cuckoo.Matchable>(weatherResponse: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == WeatherResponse {
            let matchers: [Cuckoo.ParameterMatcher<(WeatherResponse)>] = [wrap(matchable: weatherResponse) { $0 }]
            return manager.verify("saveWeatherResponse(weatherResponse: WeatherResponse)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func remove<M1: Cuckoo.Matchable>(entities: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [WeatherDetailsData] {
            let matchers: [Cuckoo.ParameterMatcher<([WeatherDetailsData])>] = [wrap(matchable: entities) { $0 }]
            return manager.verify("remove(entities: [WeatherDetailsData])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func fetchFiltered<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with: M1, equalTo: M2) -> Cuckoo.__DoNotUse<[WeatherDetailsData]> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: with) { $0.0 }, wrap(matchable: equalTo) { $0.1 }]
            return manager.verify("fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherDataStoreServiceImplStub: WeatherDataStoreServiceImpl {
    
    override var dataService: DataService! {
        get {
            return DefaultValueRegistry.defaultValue(for: (DataService!).self)
        }
        set {
        }
    }
    
    override var weatherMapper: WeatherMappable! {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherMappable!).self)
        }
        set {
        }
    }
    
    override var city: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: (String?).self)
        }
        set {
        }
    }
    
    override func saveWeatherResponse(weatherResponse: WeatherResponse) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func remove(entities: [WeatherDetailsData]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func fetchFiltered(with: String, equalTo: String) -> [WeatherDetailsData] {
        return DefaultValueRegistry.defaultValue(for: ([WeatherDetailsData]).self)
    }
}

// MARK: - Mocks generated from file: AwesomeWeather/Services/WeatherService.swift at 2017-02-22 09:03:45 +0000

//
//  WeatherService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/8/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Cuckoo
@testable import AwesomeWeather

import Alamofire
import AlamofireObjectMapper

class MockWeatherService: WeatherService, Cuckoo.Mock {
    typealias MocksType = WeatherService
    typealias Stubbing = __StubbingProxy_WeatherService
    typealias Verification = __VerificationProxy_WeatherService
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherService?
    
    func spy(on victim: WeatherService) -> Self {
        observed = victim
        return self
    }
    
    func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) {
        return manager.call("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", parameters: (city, completionHandler), original: observed.map { o in return { (city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) in o.obtainForecast(forCity: city, completionHandler: completionHandler) } })
    }
    
    struct __StubbingProxy_WeatherService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func obtainForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.StubNoReturnFunction<(String, (DataResponse<WeatherResponse>)->())> where M1.MatchedType == String, M2.MatchedType == (DataResponse<WeatherResponse>)->() {
            let matchers: [Cuckoo.ParameterMatcher<(String, (DataResponse<WeatherResponse>)->())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherService: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func obtainForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == (DataResponse<WeatherResponse>)->() {
            let matchers: [Cuckoo.ParameterMatcher<(String, (DataResponse<WeatherResponse>)->())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return manager.verify("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherServiceStub: WeatherService {
    
    func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

class MockWeatherServiceImpl: WeatherServiceImpl, Cuckoo.Mock {
    typealias MocksType = WeatherServiceImpl
    typealias Stubbing = __StubbingProxy_WeatherServiceImpl
    typealias Verification = __VerificationProxy_WeatherServiceImpl
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherServiceImpl?
    
    func spy(on victim: WeatherServiceImpl) -> Self {
        observed = victim
        return self
    }
    
    override func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) {
        return manager.call("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", parameters: (city, completionHandler), original: observed.map { o in return { (city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) in o.obtainForecast(forCity: city, completionHandler: completionHandler) } })
    }
    
    struct __StubbingProxy_WeatherServiceImpl: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func obtainForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.StubNoReturnFunction<(String, (DataResponse<WeatherResponse>)->())> where M1.MatchedType == String, M2.MatchedType == (DataResponse<WeatherResponse>)->() {
            let matchers: [Cuckoo.ParameterMatcher<(String, (DataResponse<WeatherResponse>)->())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherServiceImpl: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func obtainForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == (DataResponse<WeatherResponse>)->() {
            let matchers: [Cuckoo.ParameterMatcher<(String, (DataResponse<WeatherResponse>)->())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return manager.verify("obtainForecast(forCity: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherServiceImplStub: WeatherServiceImpl {
    
    override func obtainForecast(forCity city: String, completionHandler: @escaping (DataResponse<WeatherResponse>)->()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

// MARK: - Mocks generated from file: AwesomeWeather/Modules/WeatherForecast/Services/WeatherProviderService.swift at 2017-02-22 09:03:45 +0000

//
//  WeatherProviderService.swift
//  AwesomeWeather
//
//  Created by Vadym Brusko on 2/14/17.
//  Copyright © 2017 Vadym Brusko. All rights reserved.
//

import Cuckoo
@testable import AwesomeWeather

import Foundation

class MockWeatherProviderService: WeatherProviderService, Cuckoo.Mock {
    typealias MocksType = WeatherProviderService
    typealias Stubbing = __StubbingProxy_WeatherProviderService
    typealias Verification = __VerificationProxy_WeatherProviderService
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherProviderService?
    
    func spy(on victim: WeatherProviderService) -> Self {
        observed = victim
        return self
    }
    
    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
        return manager.call("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", parameters: (city, completionHandler), original: observed.map { o in return { (city: String, completionHandler: @escaping ([Weather]) -> ()) in o.findForecast(forCity: city, completionHandler: completionHandler) } })
    }
    
    struct __StubbingProxy_WeatherProviderService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func findForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.StubNoReturnFunction<(String, ([Weather]) -> ())> where M1.MatchedType == String, M2.MatchedType == ([Weather]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, ([Weather]) -> ())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherProviderService: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func findForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == ([Weather]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, ([Weather]) -> ())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return manager.verify("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherProviderServiceStub: WeatherProviderService {
    
    func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

class MockWeatherProviderServiceImpl: WeatherProviderServiceImpl, Cuckoo.Mock {
    typealias MocksType = WeatherProviderServiceImpl
    typealias Stubbing = __StubbingProxy_WeatherProviderServiceImpl
    typealias Verification = __VerificationProxy_WeatherProviderServiceImpl
    let manager = Cuckoo.MockManager()
    
    private var observed: WeatherProviderServiceImpl?
    
    func spy(on victim: WeatherProviderServiceImpl) -> Self {
        observed = victim
        return self
    }
    
    override var weatherDataStoreService: WeatherDataStoreService! {
        get {
            return manager.getter("weatherDataStoreService", original: observed.map { o in return { () -> WeatherDataStoreService! in o.weatherDataStoreService } })
        }
        set {
            manager.setter("weatherDataStoreService", value: newValue, original: observed != nil ? { self.observed?.weatherDataStoreService = $0 } : nil)
        }
    }
    
    override var weatherService: WeatherService! {
        get {
            return manager.getter("weatherService", original: observed.map { o in return { () -> WeatherService! in o.weatherService } })
        }
        set {
            manager.setter("weatherService", value: newValue, original: observed != nil ? { self.observed?.weatherService = $0 } : nil)
        }
    }
    
    override var weatherMapper: WeatherMappable! {
        get {
            return manager.getter("weatherMapper", original: observed.map { o in return { () -> WeatherMappable! in o.weatherMapper } })
        }
        set {
            manager.setter("weatherMapper", value: newValue, original: observed != nil ? { self.observed?.weatherMapper = $0 } : nil)
        }
    }
    
    override func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
        return manager.call("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", parameters: (city, completionHandler), original: observed.map { o in return { (city: String, completionHandler: @escaping ([Weather]) -> ()) in o.findForecast(forCity: city, completionHandler: completionHandler) } })
    }
    
    struct __StubbingProxy_WeatherProviderServiceImpl: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var weatherDataStoreService: Cuckoo.ToBeStubbedProperty<WeatherDataStoreService?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "weatherDataStoreService")
        }
        
        var weatherService: Cuckoo.ToBeStubbedProperty<WeatherService?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "weatherService")
        }
        
        var weatherMapper: Cuckoo.ToBeStubbedProperty<WeatherMappable?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "weatherMapper")
        }
        
        func findForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.StubNoReturnFunction<(String, ([Weather]) -> ())> where M1.MatchedType == String, M2.MatchedType == ([Weather]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, ([Weather]) -> ())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_WeatherProviderServiceImpl: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var weatherDataStoreService: Cuckoo.VerifyProperty<WeatherDataStoreService?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "weatherDataStoreService", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var weatherService: Cuckoo.VerifyProperty<WeatherService?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "weatherService", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var weatherMapper: Cuckoo.VerifyProperty<WeatherMappable?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "weatherMapper", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func findForecast<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forCity city: M1, completionHandler: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == ([Weather]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(String, ([Weather]) -> ())>] = [wrap(matchable: city) { $0.0 }, wrap(matchable: completionHandler) { $0.1 }]
            return manager.verify("findForecast(forCity: String, completionHandler: @escaping ([Weather]) -> ())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class WeatherProviderServiceImplStub: WeatherProviderServiceImpl {
    
    override var weatherDataStoreService: WeatherDataStoreService! {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherDataStoreService!).self)
        }
        set {
        }
    }
    
    override var weatherService: WeatherService! {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherService!).self)
        }
        set {
        }
    }
    
    override var weatherMapper: WeatherMappable! {
        get {
            return DefaultValueRegistry.defaultValue(for: (WeatherMappable!).self)
        }
        set {
        }
    }
    
    override func findForecast(forCity city: String, completionHandler: @escaping ([Weather]) -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
