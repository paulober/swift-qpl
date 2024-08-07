//
//  Title.swift
//
//
//  Created by paulober on 12.07.24.
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

public struct LocalizableText: Codable {
    public var language: String
    public var value: String?
    
    enum CodingKeys: String, CodingKey {
        case language = "Language"
        case value = ""
    }
    
    public init() {
        language = "de/de"
        value = ""
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        language = try container.decode(String.self, forKey: .language)
        value = try container.decodeIfPresent(String.self, forKey: .value)
    }
    
    // workaround used instead of property warappers because of
    // them causing self before init erros in any initialiser
    static func nodeEncoding(forKey key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.language:
            return .attribute
        default:
            return .element
        }
    }
}
