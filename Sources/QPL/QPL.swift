import Foundation
import XMLCoder
import QTI

public struct QPLFile {
    public let contentObject: QPLContentObject
    public let questestInterop: QuestestInterop
}

public class QPLReader {
    private let decoder: XMLDecoder
    
    public init() {
        self.decoder = XMLDecoder()
        self.decoder.shouldProcessNamespaces = false
    }
    
    public func readQPLXMLFile(fileURI: URL) -> QPLContentObject? {
        guard fileURI.isFileURL && FileManager.default.fileExists(atPath: fileURI.relativePath) else {
            return nil
        }
        
        if let data = try? Data(contentsOf: fileURI) {
            //return try? decoder.decode(QPLContentObject.self, from: data)
            do {
                let out = try decoder.decode(QPLContentObject.self, from: data)
                return out
            } catch {
                print("Error xml: \(error)")
            }
        }
        
        return nil
    }
    
    public func readFolder(unpackedQPLFolderURL: URL) throws -> QPLFile {
        var isNotADirectory = ObjCBool(false)
        // TODO: read consuming keyword
        // TODO: unzip into ./qpl
        guard !unpackedQPLFolderURL.isFileURL && FileManager.default.fileExists(atPath: unpackedQPLFolderURL.absoluteURL.path(percentEncoded: false), isDirectory: &isNotADirectory) && isNotADirectory.boolValue else {
            throw QPLReaderError.invalidFolderURI
        }

        var target = unpackedQPLFolderURL
        
        // find the file with qpl in its name
        var contents = try FileManager.default.contentsOfDirectory(atPath: unpackedQPLFolderURL.relativePath)
        if contents.count == 1 {
            // probably means, the contents are nested in a separate folder
            target = target.appendingPathComponent(contents.first!)
            contents = try FileManager.default.contentsOfDirectory(atPath: target.relativePath)
        }
        guard let qplFile = contents.first(where: { $0.contains("qpl") }), qplFile.hasSuffix(".xml") else {
            ensureCleanup(targetPath: target.relativePath)
            throw QPLReaderError.qplFileNotFound
        }
        guard let qtiFile = contents.first(where: { $0.contains("qti") }), qtiFile.hasSuffix(".xml") else {
            ensureCleanup(targetPath: target.relativePath)
            throw QPLReaderError.qtiFileNotFound
        }
        
        let qplFileURL = URL(fileURLWithPath: "\(target.relativePath)/\(qplFile)")
        let qtiFileURL = URL(fileURLWithPath: "\(target.relativePath)/\(qtiFile)")
        
        guard let qplContentObject = readQPLXMLFile(fileURI: qplFileURL),
              let questestInterop = QTIReader().read(fileURI: qtiFileURL) else {
            ensureCleanup(targetPath: target.relativePath)
            throw QPLReaderError.failedToRead
        }
        
        // delete unpacked zip
        ensureCleanup(targetPath: target.relativePath)
        
        return QPLFile(contentObject: qplContentObject, questestInterop: questestInterop)
    }
    
    func ensureCleanup(targetPath: String) {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: targetPath, isDirectory: nil) {
            do {
                try fileManager.removeItem(atPath: targetPath)
            } catch {
                print("Failed to cleanup: \(targetPath)")
            }
        }
    }
    
    enum QPLReaderError: Error {
        case qplFileNotFound
        case qtiFileNotFound
        case failedToRead
        case invalidFolderURI
    }
}
