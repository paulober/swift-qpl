//
//  QPLContent.swift
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

@preconcurrency import XMLCoder

// aka. ContentObject
public struct QPLContentObject: Codable {
    @Attribute public var type: String
    @Element public var metaData: MetaData
    @Element public var settings: Settings
    @Element public var pageObjs: [PageObject]
    @Element public var mediaObj: MediaObject
    @Element public var questionSkillAssignments: QuestionSkillAssignments
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case metaData = "MetaData"
        case settings = "Settings"
        case pageObjs = "PageObject"
        case mediaObj = "MediaObject"
        case questionSkillAssignments = "QuestionSkillAssignments"
    }
    
    static let xmlHeader = XMLHeader(version: 1.0, encoding: "UTF-8")
}
