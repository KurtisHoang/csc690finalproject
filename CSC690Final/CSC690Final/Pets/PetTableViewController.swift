//
//  PetTableViewController.swift
//  CSC690Final


import UIKit

class PetTableViewController: UITableViewController {
    
    var account: Accounts?
    var pets: [Pets] = []
    var petSize: Int = 20
    var selectedPet: Pets?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize random pets
        for i in 0..<petSize
        {
            //randomize animal, dogbreed, catbreed
            let randAnimal = Int.random(in: 0..<2)
            let randDogBreed = Int.random(in: 0..<3)
            let randCatBreed = Int.random(in: 0..<3)
            
            if(randAnimal == 0)
            {
                //random dog breed
                if randDogBreed == 0
                {
                    pets.append(Pets(newAnimal: "Dog", newBreed: "German Shepard"))
                }
                else if randDogBreed == 1
                {
                    pets.append(Pets(newAnimal: "Dog", newBreed: "Golden Retriever"))
                }
                else
                {
                    pets.append(Pets(newAnimal: "Dog", newBreed: "Pomeranian"))
                }
            }
            else
            {
                //random dog breed
                if randCatBreed == 0
                {
                    pets.append(Pets(newAnimal: "Cat", newBreed: "Persian Cat"))
                }
                else if randCatBreed == 1
                {
                    pets.append(Pets(newAnimal: "Cat", newBreed: "Scottish Fold"))
                }
                else
                {
                    pets.append(Pets(newAnimal: "Cat", newBreed: "Burmese Cat"))
                }
            }
        }
        
    }
    
    //tells us how many rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //get selected row
        let currPet = pets[indexPath.row]
        
        //create a new cell that is PetCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell") as! PetCell
        
        //add to cell
        cell.animalLabel.text! = currPet.animal
        cell.breedLabel.text! = currPet.breed
        cell.setIcon()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get current row
        let currPet = pets[indexPath.row]
        selectedPet = Pets(newAnimal: currPet.animal, newBreed: currPet.breed)
        performSegue(withIdentifier: "petprofileSegue", sender: self)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        //do segue
        performSegue(withIdentifier: "backpettableviewSegue", sender: self)
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        //get whole new array of pets
        for i in 0..<petSize
        {
            //randomize animal, dogbreed, catbreed
            let randAnimal = Int.random(in: 0..<2)
            let randDogBreed = Int.random(in: 0..<3)
            let randCatBreed = Int.random(in: 0..<3)
            
            if(randAnimal == 0)
            {
                //random dog breed
                if randDogBreed == 0
                {
                    pets[i] = Pets(newAnimal: "Dog", newBreed: "German Shepard")
                }
                else if randDogBreed == 1
                {
                    pets[i] = Pets(newAnimal: "Dog", newBreed: "Golden Retriever")
                }
                else
                {
                    pets[i] = Pets(newAnimal: "Dog", newBreed: "Pomeranian")
                }
            }
            else
            {
                //random dog breed
                if randCatBreed == 0
                {
                    pets[i] = Pets(newAnimal: "Cat", newBreed: "Persian Cat")
                }
                else if randCatBreed == 1
                {
                    pets[i] = Pets(newAnimal: "Cat", newBreed: "Scottish Fold")
                }
                else
                {
                    pets[i] = Pets(newAnimal: "Cat", newBreed: "Burmese Cat")
                }
            }
        }
        
        //reload the tableview to show new pets
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "backpettableviewSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? profileViewController {
                destination.account = account
            }
        }
        
        if(segue.identifier == "petprofileSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? PetProfileViewController {
                destination.account = account
                destination.animal = selectedPet
            }
        }
    }
}
