//
//  State.swift
//  MarvelMoviesApp
//
//  Created by Bedo on 16/06/2023.


import Foundation

 // State  say me what viewmodel do it do loading activityIndicator or show error 
public enum State {
    case loading
    case error
    case empty
    case populated
}
