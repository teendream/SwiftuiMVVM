//
//  FirebaseSetting.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation

class FirebaseSetting: FirebaseBaseSetting {

    private var value: AnyObject?
    private var key: String = ""
    private var title: String = ""
    private var defaultValue: AnyObject?
    private var setListener: (_ value: AnyObject) -> Void = { value in }

    func setTitle(_ title: String) {
        self.title = title
    }

    func getTitle() -> String {
        return self.title
    }

    func setKey(_ key: String) {
        self.key = key
    }

    func getKey() -> String {
        return key
    }

    func getValue() -> AnyObject {
        return value!
    }

    func setValue(_ value: AnyObject) {
        self.value = value
        if (setListener != nil) {
            setListener(value)
        }
    }

    func getDefaultValue() -> AnyObject {
        return self.defaultValue!
    }

    func setDefaultValue(_ value: AnyObject) {
        self.defaultValue = value
    }

    public func toString() -> String {
        return getKey() + " " + (getValue() as! String)
    }

    public func getDouble() -> Double {
        do {
            return getValue() as! Double
        } catch {
            print(error.localizedDescription)
        }
        do {
            return getDefaultValue() as! Double
        } catch {
            print(error.localizedDescription)
        }

        return 0
    }

    public func getLong() -> Int64 {
        do {
            return getValue() as! Int64
        } catch {
            print(error.localizedDescription)
        }
        do {
            return getDefaultValue() as! Int64
        } catch {
            print(error.localizedDescription)
        }

        return 0
    }

    public func getInt() -> Int {
        do {
            return getValue() as! Int
        } catch {
            print(error.localizedDescription)
        }
        do {
            return getDefaultValue() as! Int
        } catch {
            print(error.localizedDescription)
        }

        return 0
    }

    public func getStr() -> String {
        do {
            return getValue() as! String
        } catch {
            print(error.localizedDescription)
        }
        do {
            return getDefaultValue() as! String
        } catch {
            print(error.localizedDescription)
        }

        return ""
    }

    public func getBool() -> Bool {
        do {
            return getValue() as! Bool
        } catch {
            print(error.localizedDescription)
        }
        do {
            return getDefaultValue() as! Bool
        } catch {
            print(error.localizedDescription)
        }

        return false
    }

}
