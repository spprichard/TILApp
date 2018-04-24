import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)


public func routes(_ router: Router) throws {
    // register route, will return a Future Acronym when once it is saved
    router.post("api", "acronyms") { req -> Future<Acronym> in
        // decode request contents into Acronym type, thanks Codable
        return try req.content.decode(Acronym.self)
            // Extracts the Acronym when decoding is complete
            .flatMap(to: Acronym.self) { acronym in
                // Save using Fluent, will return the saved resource once completed
                return acronym.save(on: req)
        }
    }
}
