//
//  StringExtensions.swift
//  qNetflixClone
//
//  Created by Erencan on 19.08.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
