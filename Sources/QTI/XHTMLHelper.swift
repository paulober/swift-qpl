//
//  XHTMLHelper.swift
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
/*
func decodeHTMLEntities(_ htmlString: String) -> String? {
    guard let data = htmlString.data(using: .utf8) else { return nil }
    
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
        .documentType: NSAttributedString.DocumentType.html,
        .characterEncoding: String.Encoding.utf8.rawValue
    ]
    
    do {
        let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
        return attributedString.string
    } catch {
        print("Error decoding HTML: \(error)")
        return nil
    }
}*/

let encodingMap: [String: String] = [
    "quot": "\"",
    "lt": "<",
    "gt": ">",
    "amp": "&",
    "apos": "'",
    "nbsp": " ",
    "copy": "©",
    "reg": "®",
    "trade": "™",
    "bull": "•",
    "shy": "­",
    "frac14": "1/4",
    "frac12": "1/2",
    "frac34": "3/",
    "iquest;": "?",
    "mdash": "—",
    "ndash": "–",
    "plusmn": "±",
    "times": "×",
    "divide": "÷",
    "euro": "€",
    "yen": "¥",
    "sect": "§",
    "para": "¶",
    "middot": "·",
    "raquo": "»",
    "laquo": "«",
    "deg": "°",
    "sup2": "²",
    "sup3": "³",
    "acute": "´",
    "micro": "µ",
    "#13": "\n",
    "#10": "\n",
    
]

func decodeHTMLEntities(_ htmlString: String) -> String {
    var encodedString = htmlString
    for enc in encodingMap {
        let range = htmlString.range(of: enc.key)
        if let range = range {
            encodedString.replaceSubrange(range, with: enc.value)
        }
    }
    return encodedString
}
