//
//  VarEqual.swift
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

public struct VarEqual: Codable {
    public var respident: String
    public var value: Int
    
    enum CodingKeys: String, CodingKey {
        case respident = "respident"
        case value = ""
    }
    
    static func nodeEncoding(forKey key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.respident:
            return .attribute
        default:
            return .element
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            respident = try container.decode(String.self, forKey: .respident)
        } catch {
            print("How??")
            respident = ""
        }
        value = try container.decode(Int.self, forKey: .value)
    }
}
