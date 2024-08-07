//
//  MediaItem.swift
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

public struct MediaItem: Codable {
    @Attribute var purpose: String
    @Element var location: Location
    @Element var format: Format
    @Element var layout: Layout
    
    enum CodingKeys: String, CodingKey {
        case purpose = "Purpose"
        case location = "Location"
        case format = "Format"
        case layout = "Layout"
    }
}
