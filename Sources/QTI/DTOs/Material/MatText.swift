//
//  MatText.swift
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

import XMLCoder

public enum MatTextType: String, Codable {
    case plainText = "text/plain"
    case xHTML = "text/xhtml"
}

public struct MatText: Codable {
    public var textType: String
    public var value: String
    
    func getDecodedValue() -> String {
        return decodeHTMLEntities(self.value)
    }
    
    enum CodingKeys: String, CodingKey {
        case textType = "texttype"
        case value = ""
    }
    
    // workaround for @ELement on value properties
    static func nodeEncoding(forKey key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.textType:
            return .attribute
        default:
            return .element
        }
    }
}
