//
//  ChecklistItem.swift
//  ChecklistV2
//
//  Created by 신나현 on 2021/06/03.
//

import Foundation

struct ChecklistItem: Identifiable, Codable {    //unique한 이름이 필요함
    let id = UUID()     //unidue한 id
    var name: String
    var isChecked: Bool = false
}
