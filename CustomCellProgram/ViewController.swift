//
//  ViewController.swift
//  CustomCellProgram
//
//  Created by Alivelu Ravula on 4/5/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
  var tblView:UITableView?
  var  actorsArray=[#imageLiteral(resourceName: "samantha"),#imageLiteral(resourceName: "Kajal-Aggarwal"),#imageLiteral(resourceName: "keerthi"),#imageLiteral(resourceName: "mehreen"),#imageLiteral(resourceName: "rashi")]
    
//  var  actorsNames=["Samantha","Kagal","Keerthi","Mehreen","Rashi"]
//    var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
    
    var  actorsNames:Dictionary=["Samantha": sam, "Kagal": agarwal, "Keerthi": suresh, "Mehreen": mah, "Rashi":kanna ]

    var logoImg=[#imageLiteral(resourceName: "bjplogo"),#imageLiteral(resourceName: "congresslogo"),#imageLiteral(resourceName: "AITC"),#imageLiteral(resourceName: "AAP"),#imageLiteral(resourceName: "NCP")]
    var leaderImg=[#imageLiteral(resourceName: "Amith"),#imageLiteral(resourceName: "rahul"),#imageLiteral(resourceName: "mamata"),#imageLiteral(resourceName: "Aravind"),#imageLiteral(resourceName: "sharad")]
    var prtyNamArry=["BJP","Congress","AITC","AAP","NCP"]
    var leaderNamArry=["Amith","Rahul","Mamata","Aravind","Sharad"]
    var stateNamArry=["Delhi","Delhi","West Bengal","Punjab","Delhi"]
    
    var criImg=[#imageLiteral(resourceName: "sachin"),#imageLiteral(resourceName: "dhoni"),#imageLiteral(resourceName: "virat"),#imageLiteral(resourceName: "Dhawan"),#imageLiteral(resourceName: "suresh")]
    var crickNams=["Sachin","M.Dhoni","Virat","S.Dhawan","Suresh"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tblView=UITableView(frame:CGRect(x: 0, y: 10, width: self.view.bounds.size.width, height: self.view.bounds.size.height),style:UITableViewStyle.grouped)
        tblView=UITableView(frame:view.bounds,style:UITableViewStyle.grouped)
        tblView?.autoresizingMask=[.flexibleWidth,.flexibleHeight]
        tblView?.dataSource=self
        tblView?.delegate=self
        
        tblView?.register(Actors.self, forCellReuseIdentifier: "Actors")
        var cell = UINib(nibName:"Actors" ,bundle:nil)
        tblView?.register(cell, forCellReuseIdentifier: "Actors")
        
        tblView?.register(Politicians.self, forCellReuseIdentifier: "Politicians")
        var cell2=UINib(nibName:"Politicians", bundle:nil)
        tblView?.register(cell2, forCellReuseIdentifier: "Politicians")
        
        
        tblView?.register(Cricketers.self, forCellReuseIdentifier: "Cricketers")
        var cell3=UINib(nibName:"Cricketers",bundle:nil)
        tblView?.register(cell3, forCellReuseIdentifier: "Cricketers")
        
        
        self.view.addSubview(tblView!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==2)
        {
            return actorsArray.count
        }
        else if(section==1)
        {
            
            return logoImg.count
        }
        else if(section==0)
        {
            return criImg.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tblCell=UITableViewCell()
        if(indexPath.section==2)
        {
        let cell = tblView?.dequeueReusableCell(withIdentifier: "Actors", for: indexPath) as! Actors
        cell.imgActrs.image=actorsArray[indexPath.row]
//        cell.actrNameslbl.text=actorsNames[indexPath.row]
//       cell.backgroundColor=UIColor.init(patternImage: actorsArray[indexPath.row])
         return cell
        }
        else if(indexPath.section==1)
        {
            let cell = tblView?.dequeueReusableCell(withIdentifier: "Politicians", for: indexPath) as! Politicians
            
            cell.logo.image=logoImg[indexPath.row]
            cell.leaders.image=leaderImg[indexPath.row]
            cell.leaderName.text=leaderNamArry[indexPath.row]
            cell.StateName.text=stateNamArry[indexPath.row]
            cell.partyName.text=prtyNamArry[indexPath.row]
            return cell
            
        }
        else if(indexPath.section==0)
        {
            
            let cell=tblView?.dequeueReusableCell(withIdentifier: "Cricketers", for: indexPath)  as! Cricketers
            
            cell.namesCric.text=crickNams[indexPath.row]
            cell.imagCric.image=criImg[indexPath.row]
            return cell
        }
        
        return tblCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section==0)
        {
            return 355
        }
        else
        {
            return 250
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let myLabel=UILabel(frame:CGRect(x:0, y: 10, width: tableView.bounds.size.width, height: 30))
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.addSubview(myLabel)
        
        if (section == 2) {
            headerView.backgroundColor = UIColor.orange
             myLabel.text="Actors"
            myLabel.textColor=UIColor.black
            myLabel.font=UIFont.boldSystemFont(ofSize: 25)
            myLabel.textAlignment = .center
            
        } else if(section==1) {
            headerView.backgroundColor = UIColor.brown
            myLabel.text="Politicians"
            myLabel.textColor=UIColor.white
            myLabel.font=UIFont.boldSystemFont(ofSize: 25)
            myLabel.textAlignment = .center
            
        }else if(section==0)
        {
            headerView.backgroundColor = UIColor.orange
            myLabel.text="Cricketers"
            myLabel.textColor=UIColor.yellow
            myLabel.font=UIFont.boldSystemFont(ofSize: 25)
            myLabel.textAlignment = .center
            
        }
        return headerView
    }

    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
//     {
//        if(section==0)
//
////        switch section
////        {
////        case 0:
////
////            return "Actors"
////        case 1:
////            return " Politicians"
////        default:
////            return " Cricketers"
////        }
//    }
//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

