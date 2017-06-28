//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Abhineet Raj on 6/17/16.
//  Copyright © 2016 clinz. All rights reserved.
//
// After building the program if you want to add further attributes, always delete the app from the simulator or the phone and then re-build your app.


import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // needed to connect App delegate to talk to coredata database -users.
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        /* -- commenting out to avoid any more users and searching for users instead.
         
         
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Fio", forKey: "username")
        newUser.setValue("passmeon", forKey: "password")

        do
        {
         
            try context.save() // saving the two new values to the database.
        }
        
        catch
        {
            print("there was a problem")
            
        }
        
        */
        let request = NSFetchRequest(entityName: "Users") // creating a request to get some data from the table/entity called Users.
        
        request.predicate =  NSPredicate (format: "username = %@", "Abhi") // Searching for username with text Abhineet
        
        
        request.returnsObjectsAsFaults = false // if you want to see what values are being returned from the entity/objects. 
        
        do
        {
        
        let results = try context.executeFetchRequest(request) // to fetch the request inside a result set.
         //print (results) // we will only need to print only when fetch is successful, commenting was done to try to print only the values instead of the other messages which comes along.
            
         if results.count > 0
         {
            for result in results as! [NSManagedObject]
            {
                //context.deletedObjects(result) - if uncommented will delete the entry Abhi from the database, rest two username/password combination will remain intact.
                
                result.setValue("Abhineet", forKey: "username")
                
                do{
                        try context.save() // also updating in the database.
                }
                
                catch {
                    
                }
                
                if let username = result.valueForKey("username") as? String
                {
                
                print(username)
                    
                    //print(result.valueForKey("username")!)
                }
                    
                //print(result.valueForKey("password")!)
                
            }
            
            
            }
        
        } catch
        
        
        {
            print("There was something wrong in fetching the request")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

