import Testing
import Foundation
@testable import QPL

@Test func testQPLZip() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let qplReader = QPLReader()
    print(FileManager.default.currentDirectoryPath)
    let fp = URL(filePath: "qpl.zip", directoryHint: .notDirectory, relativeTo: URL(filePath: "/Users/paulober/Developer/swift-qpl/"))
    let file = try qplReader.readZip(zipFileURI: fp)
    print(file.questestInterop.items.count)
    assert(file.questestInterop.items.count == 23)
}
