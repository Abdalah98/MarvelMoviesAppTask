//
//  String+EXT.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 17/06/2023.
//

import Foundation

extension String {
    func convertToDate(from inputFormat: String, to outputFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = outputFormat
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
}
