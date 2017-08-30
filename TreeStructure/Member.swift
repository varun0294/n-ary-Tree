//
//  Node.swift
//  TreeStructure
//
//  Created by Varun Wadhwa on 30/08/17.
//  Copyright © 2017 Varun Wadhwa. All rights reserved.
//

import Foundation


class Member {
    
    var firstName: String
    var lastName : String
    
    var team: [Member] = []
    
    weak var parent: Member?
    
    init(firstName: String , lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func add(teamMember : Member) {
        team.append(teamMember)
        teamMember.parent = self
    }
}


extension Member : CustomStringConvertible {
    // 2
    var description: String {
        // 3
        var text = "\(firstName)" //\(lastName)"
       // var lastName = "\(lastName)"
        
        // 4
        if !team.isEmpty {
            text += " [ " + team.map { $0.description }.joined(separator: ", ") + " ] "
        }
        return text
    }
}
