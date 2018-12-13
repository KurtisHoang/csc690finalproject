//
//  MessageViewController.swift
//  CSC690Final


import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var account: Accounts?
    var animal: Pets?
    var messageList: [Message] = []
    
    /*
    to make the tableview have no lines
     click separator none
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //make rows for tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messageList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as! MessageCell
        
        cell.side = message.num
        cell.currMessage = message.text
        
        return cell
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if textField.text != "" {
            messageList.append(Message(newText: textField.text!, newNum: 1))
            textField.text = ""
        }
        self.tableView.reloadData()
    }
    
    @IBAction func responseButtonPressed(_ sender: Any) {
        
        //random number 0-2
        let randomInt = Int.random(in: 0 ..< 3)
        //if animal is a dog
        if(animal?.animal == "Dog")
        {
            switch randomInt {
            case 0:
                messageList.append(Message(newText: "Woof!", newNum: 0))
            case 1:
                messageList.append(Message(newText: "Ruff!", newNum: 0))
            case 2:
                messageList.append(Message(newText: "Bark Bark!", newNum: 0))
            default:
                messageList.append(Message(newText: "Woof!", newNum: 0))
            }
        }
        else // if animal is a cat
        {
            switch randomInt {
            case 0:
                messageList.append(Message(newText: "Meow!", newNum: 0))
            case 1:
                messageList.append(Message(newText: "Nya!", newNum: 0))
            case 2:
                messageList.append(Message(newText: "Meow Meow!", newNum: 0))
            default:
                messageList.append(Message(newText: "Mew!", newNum: 0))
            }
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backchatSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "backchatSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? PetProfileViewController
            {
                destination.account = account
                destination.messageList = messageList
                destination.animal = animal
            }
        }
    }
}
