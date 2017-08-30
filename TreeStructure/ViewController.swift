//
//  ViewController.swift
//  TreeStructure
//
//  Created by Varun Wadhwa on 30/08/17.
//  Copyright © 2017 Varun Wadhwa. All rights reserved.
//

import UIKit
import SwiftyJSON

extension ViewController : UITableViewDataSource , UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func readJson()  {
        do {
            if let file = Bundle.main.url(forResource: "TeamAPIResponse", withExtension: "json") {
                let data = try Data(contentsOf: file)
                
                let json = JSON(data)
                
                let rootNode = Member.init(firstName: "Amitabh" , lastName: "Bachan")
                
                createTree(json: json["team"] , rootNode: rootNode)
                
                print(rootNode.description)
                
                print("===================")
                
                print(rootNode.search(firstName: "Amir")!.description)
                print(rootNode.search(firstName: "Amir")!.isMemberWithNoSupervisorMembers()) // false
                print(rootNode.search(firstName: "Amitabh")!.isMemberWithNoSupervisorMembers()) //false
                print(rootNode.search(firstName: "Varun")!.isMemberWithNoSupervisorMembers()) //true
            
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    
    func createTree(json : JSON , rootNode : Member) {
        json.forEach({ member in
          let memberNode = Member.init(firstName: member.1["firstName"].string! , lastName: member.1["lastName"].string!)
           rootNode.add(teamMember: memberNode)
           memberNode.parent = rootNode
            if (member.1["team"].count > 0){
              createTree(json: member.1["team"] , rootNode: memberNode)
            }
        })
    }
    

}

