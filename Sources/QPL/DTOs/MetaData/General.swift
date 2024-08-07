//
//  General.swift
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

public struct General: Codable {
    @Attribute var structure: String
    @Element var identifier: Identifier
    @Element var title: LocalizableText
    @Element var language: LocalizableText
    @Element var description: LocalizableText
    @Element var keyword: LocalizableText
    
    enum CodingKeys: String, CodingKey {
        case structure = "Structure"
        case identifier = "Identifier"
        case title = "Title"
        case language = "Language"
        case description = "Description"
        case keyword = "Keyword"
    }
}
