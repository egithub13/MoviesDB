//
//  MovieCardViewModel.swift
//  MoviesDB
//
//  Created by eric hayes on 6/21/24.
//

import Foundation



final class MovieCardViewModel: ObservableObject {
  var movies: [Movie]?
  static var apiKey = "?api_key=3cacb81177789b109b9e5e1548f86381"
  static var baseImageURL = "https://image.tmdb.org/t/p/w185"
  static var demo = Movie(id: 00001, title: "Kingdom of the Planet of the Apes", overview: "blah blah with monkeys", releaseDate: "2024-05-08", posterPath: "https://image.tmdb.org/t/p/w185/gKkl37BQuKTanygYQG1pyYgLVgf.jpg", voteAverage: 6.87, baseImageURL: MovieCardViewModel.baseImageURL)
  
 
}
