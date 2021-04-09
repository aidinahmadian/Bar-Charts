//
//  ViewController.swift
//  Bar Charts in Swift
//
//  Created by Aidin Ahmadian on 4/9/21.
//

import UIKit
import Charts
import SafariServices

class ViewController: UIViewController {
    
    //MARK: - Create Bar Chart / Label / Buttons
    
    private let barChart: BarChartView = {
        let chart = BarChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    private let twitterButton: UIButton = {
        let tb = UIButton()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.setImage(UIImage.init(named: "twitter"), for: .normal)
        tb.addTarget(self, action: #selector(twitterButtonAction), for: .touchUpInside)
        tb.imageView?.contentMode = .scaleAspectFill
        tb.clipsToBounds = true
        return tb
    }()
    
    private let instagramButton: UIButton = {
        let ib = UIButton()
        ib.translatesAutoresizingMaskIntoConstraints = false
        ib.setImage(UIImage.init(named: "instagram"), for: .normal)
        ib.clipsToBounds = true
        ib.addTarget(self, action: #selector(instagramButtonAction), for: .touchUpInside)
        return ib
    }()
    
    private let githubButton: UIButton = {
        let gb = UIButton()
        gb.translatesAutoresizingMaskIntoConstraints = false
        gb.setImage(UIImage.init(named: "git"), for: .normal)
        gb.clipsToBounds = true
        gb.addTarget(self, action: #selector(githubButtonAction), for: .touchUpInside)
        return gb
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createChart()
        setupViews()
        setupConstraints()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Bar Charts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Functions
    private func setupViews() {
        view.addSubview(barChart)
        view.addSubview(twitterButton)
        view.addSubview(instagramButton)
        view.addSubview(githubButton)
    }
    
    private func setupConstraints() {
        barChart.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        barChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        barChart.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        barChart.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        twitterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        instagramButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        instagramButton.trailingAnchor.constraint(equalTo: twitterButton.leadingAnchor, constant: -20).isActive = true
        instagramButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        instagramButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        githubButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        githubButton.leadingAnchor.constraint(equalTo: twitterButton.trailingAnchor, constant: 20).isActive = true
        githubButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        githubButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func createChart() {
        
        //- Supply Data
        var entries = [BarChartDataEntry]()
        var secondEntries = [BarChartDataEntry]()
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...30)))
            secondEntries.append(BarChartDataEntry(x: Double(x), y: Double.random(in: 0...30)))
        }
        let set = BarChartDataSet(entries: entries, label: "Cost")
        set.colors = [
            NSUIColor(cgColor: UIColor.systemBlue.cgColor),
            NSUIColor(cgColor: UIColor.systemPink.cgColor),
            NSUIColor(cgColor: UIColor.systemRed.cgColor),
            NSUIColor(cgColor: UIColor.systemGray.cgColor),
            NSUIColor(cgColor: UIColor.systemYellow.cgColor),
            NSUIColor(cgColor: UIColor.systemPurple.cgColor),
            NSUIColor(cgColor: UIColor.brown.cgColor),
            NSUIColor(cgColor: UIColor.cyan.cgColor),
            NSUIColor(cgColor: UIColor.systemOrange.cgColor),
        ]
        
        let secondSet = BarChartDataSet(entries: secondEntries, label: "Cost")
        secondSet.colors = [
            NSUIColor(cgColor: UIColor.systemBlue.cgColor),
            NSUIColor(cgColor: UIColor.systemPink.cgColor),
            NSUIColor(cgColor: UIColor.systemRed.cgColor),
            NSUIColor(cgColor: UIColor.systemGray.cgColor),
            NSUIColor(cgColor: UIColor.systemYellow.cgColor),
            NSUIColor(cgColor: UIColor.systemPurple.cgColor),
            NSUIColor(cgColor: UIColor.brown.cgColor),
            NSUIColor(cgColor: UIColor.cyan.cgColor),
            NSUIColor(cgColor: UIColor.systemOrange.cgColor),
        ]
        
        let data = BarChartData(dataSets: [set, secondSet])
        barChart.data = data
    }
    
    //MARK: - @objc Functions
    @objc func twitterButtonAction() {
        print("Twitter Button Clicked 🤘🏻")
        showSafariVC(for: "https://twitter.com/Corrrky")
    }
    
    @objc func instagramButtonAction() {
        print("Instagram Button Clicked 🤘🏻")
        showSafariVC(for: "https://www.instagram.com/aidinahmadian/")
    }
    
    @objc func githubButtonAction() {
        print("GitHub Button Clicked 🤘🏻")
        showSafariVC(for: "https://github.com/aidinahmadian")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
}
