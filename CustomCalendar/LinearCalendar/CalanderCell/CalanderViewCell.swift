//
//  CalanderViewCell.swift
//  Calander
//
//  Created by Apptunix on 24/02/22.
//

import UIKit

class CalanderViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 10
    }
    
    func configCell(date: Date) {
        dayLbl.text = formatDay(date: date)
        dateLbl.text = formatDate(date: date)
    }

    fileprivate  func formatDate(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .medium
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: formatter1.string(from: date))
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date!)
    }
    
    fileprivate  func formatDay(date: Date) -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .medium
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: formatter1.string(from: date))
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date!)
    }
    
}
