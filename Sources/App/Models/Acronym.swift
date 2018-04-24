import Vapor
import FluentSQLite

// Marking this a final is a preformance win, but why?
final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String){
        self.short = short
        self.long = long
    }
}

// Tells compiler to use this Protocol, will handle ID tpye stuff for you
extension Acronym: SQLiteModel {}

// For the DB scheme, Fluent will infer scheme becuase of the Codable protocol
extension Acronym: Migration {}

// Vapors wrapper around Codable protocol, allows us to save this Swift type 
extension Acronym: Content{}
