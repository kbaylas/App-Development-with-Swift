//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Kaan Baylas on 28.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController
{
    
    var emojis: [Emoji] =
    [Emoji(symbol: "😃", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
     Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure."),
     Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with heart for eyes", usage: "love of something; attractive"),
     Emoji(symbol: "👮🏻‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
     Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle", usage: "Something slow"),
     Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
     Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti", usage: "Spaghetti"),
     Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
     Emoji(symbol: "⛺️", name: "Tent", description: "A small tent", usage: "camping"),
     Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
     Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "Extreme sadness"),
     Emoji(symbol: "💤", name: "Snore", description: "Three blue z's", usage: "tired, sleepiness."),
     Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion."),
     Emoji(symbol: "🤢", name: "Sick Face", description: "A green face which is about to puke", usage: "Extreme sickness"),
     Emoji(symbol: "🐶", name: "Dog", description: "A cute dog", usage: "Something cute"),
     Emoji(symbol: "✈️", name: "Plane", description: "A flying plane", usage: "Travel")
    ]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return emojis.count
        }
        else
        {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        
        // Step 2: Fetch model object to display
        let emoji = emojis[indexPath.row]
        
        // Step 3: Configure cell
        cell.update(with: emoji)
        cell.showsReorderControl = true
        
        // Step 4: Return cell
        return cell
    }
    

    
    @IBAction func editButtonTapped(_ sender: Any)
    {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
    {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle
    {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "EditEmoji"
        {
            let indexpPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexpPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            
            addEditEmojiTableViewController.emoji = emoji
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue)
    {
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? AddEditEmojiTableViewController,
            let emoji = sourceViewController.emoji else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow
        {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        else
        {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
}
