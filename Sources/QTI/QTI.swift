//
//  QTI.swift
//
//
//  Created by paulober on 16.07.24.
//
//  The contents of this file are subject to the Mozilla Public
//  License Version 2.0 (the "License"); you may not use this file
//  except in compliance with the License. You may obtain a copy of
//  the License at http://mozilla.org/MPL/2.0/.
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an "AS
//  IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
//  express or implied. See the License for the specific language
//  governing permissions and limitations under the License.
//

import Foundation
import XMLCoder

public class QTIReader {
    private let decoder: XMLDecoder
    
    public init() {
        self.decoder = XMLDecoder()
        self.decoder.shouldProcessNamespaces = false
    }
    
    public func read(fileURI: URL) -> QuestestInterop? {
        guard fileURI.isFileURL && FileManager.default.fileExists(atPath: fileURI.relativePath) else {
            return nil
        }
        
        if let data = try? Data(contentsOf: fileURI) {
            do {
                let out = try decoder.decode(QuestestInterop.self, from: data)
                return out
            } catch {
                print("QTI XML Error: \(error)")
            }
        }
        
        return nil
    }
}
