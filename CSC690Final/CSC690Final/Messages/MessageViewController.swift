//
//  MessageViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/11/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var messageList: [Message] = []
    
    //make rows for tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    //when selecting a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messageList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessageCell
        
        //add to cell
        
        return cell
    }
    
    
}
