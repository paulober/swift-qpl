# Swift QPL/QTI parsing package

A small swift package for parsing qpl and qti files.

### Usage

```swift
let qplReader = QPLReader()
print(FileManager.default.currentDirectoryPath)
let fp = URL(filePath: "qpl.zip", directoryHint: .notDirectory, relativeTo: URL(filePath: "/path/to/my/dir/"))
let file = try qplReader.readZip(zipFileURI: fp)
print(file.questestInterop.items.count)
assert(file.questestInterop.items.count > 0)
```
