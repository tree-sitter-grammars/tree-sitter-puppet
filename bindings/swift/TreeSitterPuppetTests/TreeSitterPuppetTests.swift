import XCTest
import SwiftTreeSitter
import TreeSitterPuppet

final class TreeSitterPuppetTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_puppet())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Puppet grammar")
    }
}
