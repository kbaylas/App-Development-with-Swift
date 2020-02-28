//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Kaan Baylas on 18.02.2020.
//

import Foundation
import UIKit

class AthleteFormViewController: UIViewController
{
    
    struct PropertyKeys
    {
        static let unwind = "UnwindToAthleteTable"
    }
    
    @IBOutlet weak var athleteName: UITextField!
    @IBOutlet weak var athleteAge: UITextField!
    @IBOutlet weak var athleteLeague: UITextField!
    @IBOutlet weak var athleteTeam: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateView()
    }
    
    var athlete: Athlete?
    
    func updateView()
    {
        guard let athlete = athlete else {return}
        
            athleteName.text = athlete.name
            athleteAge.text = athlete.age
            athleteLeague.text = athlete.league
            athleteTeam.text = athlete.team
    }
    
    @IBAction func saveAthlete(_ sender: Any)
    {
        guard let name = athleteName.text,
            let age = athleteAge.text,
            let league = athleteLeague.text,
            let team = athleteTeam.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
}
