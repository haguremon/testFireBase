//
//  IGFeedPostGeneralTableViewCell.swift
//  testFireBase
//
//  Created by IwasakIYuta on 2021/10/10.
//

import UIKit

/// Comments
class IGFeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostGeneralTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // Configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
