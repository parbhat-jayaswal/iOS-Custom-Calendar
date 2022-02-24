//
//  CustomCalanderView.swift
//  Calander
//
//  Created by Apptunix on 24/02/22.
//

import UIKit

enum SelectionType {
    case single
    case multiple
}

class CustomCalanderView: UIView {
    
    @IBOutlet weak var monthLbl: UILabel!
    @IBOutlet weak var calanderCollectionView: UICollectionView!
    
    var selectionType :SelectionType = .multiple
    fileprivate var calanderDateList: [Date] = []
    fileprivate var currentMonth: Int = 0

    var singleSelectedDate: Date?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        initilize()
    }
    
    private func initilize() {
        calanderCollectionView.delegate = self
        calanderCollectionView.dataSource = self
        self.calanderCollectionView.register(UINib(nibName: "CalanderViewCell", bundle: nil), forCellWithReuseIdentifier: "CalanderViewCell")
        initilizeDate(date: Date())
    }
    
    private func initilizeDate(date: Date) {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.day, from: date)
        if let weekdays = calendar.range(of: .day, in: .month, for: date) {
            calanderDateList = (weekdays.lowerBound ..< weekdays.upperBound)
                .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: date) }.filter { $0 >= Date() }
        }
        if let month = calanderDateList.first { monthLbl.text = monthStr(date: month) }
        calanderCollectionView.reloadData()
    }
    
    private func monthStr(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if currentMonth < 12 {
            currentMonth += 1
            let nextMonth = Calendar.current.date(byAdding: .month, value: currentMonth, to: Date())
            initilizeDate(date: nextMonth ?? Date())
        }
    }
    
    @IBAction func prevBtnAction(_ sender: UIButton) {
        if currentMonth >= 1 {
            currentMonth -= 1
            let nextMonth = Calendar.current.date(byAdding: .month, value: currentMonth, to: Date())
            initilizeDate(date: nextMonth ?? Date())
        }
    }
}

extension CustomCalanderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 90)
    }
}

extension CustomCalanderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calanderDateList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = calanderCollectionView.dequeueReusableCell(withReuseIdentifier: "CalanderViewCell", for: indexPath) as! CalanderViewCell
        
        cell.configCell(date: calanderDateList[indexPath.row])
        
        return cell
    }
}

extension CustomCalanderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch selectionType {
        case .single:
            singleSelectedDate = calanderDateList[indexPath.row]
        case .multiple :
            print("Multiple Type")
        }
    }
}
