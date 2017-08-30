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
    var description: String {
        var text = "\(firstName)" //\(lastName)"
       // var lastName = "\(lastName)"
        if !team.isEmpty {
            text += " [ " + team.map { $0.description }.joined(separator: ", ") + " ] "
        }
        return text
    }
    
    func search(firstName: String) -> Member? {
        if firstName == self.firstName {
            return self
        }
        for member in team {
            if let found = member.search(firstName: firstName) {
                return found
            }
        }
        return nil
    }
    
    
    func isMemberWithNoSupervisorMembers() -> Bool{ // -> [Member] {
        
        
        for members in team{
            if members.team.count > 0 {
               return false
            } else {
                continue;
            }
        }
        
    
      return true
    
    }
    
    
}
