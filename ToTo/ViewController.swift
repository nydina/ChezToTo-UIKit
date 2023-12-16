//
//  ViewController.swift
//  ToTo
//
//  Created by Dina RAZAFINDRATSIRA on 22/11/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var banImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    private func setUpUI() {
        self.menuButton.layer.cornerRadius = 10
        self.setUpDetailsView()
    }
    

   
    private func setUpDetailsView() {
        let schedule: [(day: String, hours: String)] = [
            ("Lundi", "Fermé"),
            ("Mardi", "11h30-14h30・18h30-22h00"),
            ("Mercredi", "11h30-14h30・18h30-22h00"),
            ("Jeudi", "11h30-14h30・18h30-22h00"),
            ("Vendredi", "11h30-14h30・18h30-22h00"),
            ("Samedi", "11h30-14h30・18h30-22h00"),
            ("Dimanche", "Fermé")
        ]
        var previousView : UIView = self.detailsView
        
        for (day, hours) in schedule {
            let lineView = LineView()
            lineView.setUpLineContent(day: day, schedule: hours)
            self.detailsView.addSubview(lineView)
            lineView.translatesAutoresizingMaskIntoConstraints = false
            if previousView === self.detailsView {
                lineView.topAnchor.constraint(equalTo: previousView.topAnchor).isActive = true
            } else {
                lineView.topAnchor.constraint(equalTo: previousView.bottomAnchor).isActive = true
            }
            
            lineView.leftAnchor.constraint(equalTo: self.detailsView.leftAnchor).isActive = true
            lineView.rightAnchor.constraint(equalTo: self.detailsView.rightAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            previousView = lineView
        }
        
        let contactDetails: [(icon: String, detail: String)] = [
            ("Localisation", "12  Rue Tolbiac - 75013 Paris"),
            ("Site", "www.cheztotopizza.fr"),
            ("Vector", "06 12 34 56 78")
        ]
        
        for (icon,detail) in contactDetails {
                let lineView2 = LineView2()
                lineView2.setUpLineContent(icon: icon, detail: detail)
                self.detailsView.addSubview(lineView2)
                lineView2.translatesAutoresizingMaskIntoConstraints = false
                lineView2.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 10).isActive = true
                lineView2.leftAnchor.constraint(equalTo: self.detailsView.leftAnchor).isActive = true
                lineView2.rightAnchor.constraint(equalTo: self.detailsView.rightAnchor).isActive = true
                lineView2.heightAnchor.constraint(equalToConstant: 20).isActive = true
                previousView = lineView2
            }
        
        let mapImageView: UIImageView = UIImageView(image: UIImage(named: "map"))
        self.detailsView.addSubview(mapImageView)
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mapImageView.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 30).isActive = true
        mapImageView.leftAnchor.constraint(equalTo: self.detailsView.leftAnchor).isActive = true
        mapImageView.rightAnchor.constraint(equalTo: self.detailsView.rightAnchor).isActive = true
        mapImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        previousView = mapImageView
        
    }
    
}

class LineView: UIView {
    var day: String = ""
    var schedule: String = ""
    
    func setUpLineContent(day: String,  schedule: String) {
        self.day = day
        self.schedule = schedule
        
        self.setUp()
    }
    
    func setUp() {
        let clockImageView: UIImageView = UIImageView(image: UIImage(named: "clock"))
        self.addSubview(clockImageView)
        
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        clockImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        clockImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        clockImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        let dayLabel: UILabel = UILabel()
        dayLabel.text = self.day
        self.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: clockImageView.rightAnchor, constant: 8).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        let scheduleLabel: UILabel = UILabel()
        scheduleLabel.text = self.schedule
        scheduleLabel.font.withSize(10)
        scheduleLabel
            .textAlignment = .right
        self.addSubview(scheduleLabel)
        
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        scheduleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scheduleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        scheduleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}

class LineView2: UIView {
    var icon: String = ""
    var detail: String = ""
    
    func setUpLineContent(icon: String,  detail: String) {
        self.icon = icon
        self.detail = detail
        
        self.setUp()
    }
    
    func setUp() {
        let iconImageView: UIImageView = UIImageView(image: UIImage(named: icon))
        self.addSubview(iconImageView)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        let detailLabel: UILabel = UILabel()
        detailLabel.text = self.detail
        self.addSubview(detailLabel)
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8).isActive = true
        detailLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        detailLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
    }
}
