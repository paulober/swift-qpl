//
//  Item.swift
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

public struct Item: Codable {
    public var ident: String
    public var title: String
    public var maxAttempts: Int?
    
    public var qtiComment: String
    public var duration: String
    public var itemMetadata: ItemMetadata
    public var presentation: Presentation
    public var resProcessing: ResProcessing
    public var itemFeedbacks: [ItemFeedback]
    public var solutionHint: SolutionHint?
    
    enum CodingKeys: String, CodingKey {
        case ident = "ident"
        case title = "title"
        case maxAttempts = "maxattempts"
        case qtiComment = "qticomment"
        case duration = "duration"
        case itemMetadata = "itemmetadata"
        case presentation = "presentation"
        case resProcessing = "resprocessing"
        case itemFeedbacks = "itemfeedback"
        case solutionHint = "solutionhint"
    }
    
    static func nodeEncoding(forKey key: CodingKey) -> XMLEncoder.NodeEncoding {
        switch key {
        case CodingKeys.ident:
            fallthrough
        case CodingKeys.title:
            fallthrough
        case CodingKeys.maxAttempts:
            return .attribute
        case CodingKeys.qtiComment:
            fallthrough
        case CodingKeys.duration:
            return .both
        default:
            return .element
        }
    }
}
