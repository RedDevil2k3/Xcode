//
//  Extensions.swift
//  Netfix Clone
//
//  Created by Abhimanyu Joshi on 7/19/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
