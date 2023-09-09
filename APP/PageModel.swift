//
//  PageModel.swift
//  APP
//
//  Created by MacBook Aor on 2023-09-11.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID() // Unique identifier for each page
    var name: String // Name of the page
    var description: String // Description of the page
    var imageUrl: String // Image URL for the page
    var tag: Int // Tag to identify the page
    
    // Sample page for debugging and testing
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    // Sample pages for use in the application
    static var samplePages: [Page] = [
        Page(name: "One-Click Tracking", description: "Keep track of your financial activities in a matter of seconds", imageUrl: "FirstImage", tag: 0),
        Page(name: "Graph Visualizations", description: "Be aware of the source of your money", imageUrl: "SecondImage", tag: 1),
    ]
}
