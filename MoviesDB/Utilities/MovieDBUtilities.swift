//
//  MovieCardViewModel.swift
//  MoviesDB
//
//  Created by eric hayes on 6/21/24.
//

import Foundation

enum APIKeys: String {
  case movieDB = "api_key=3cacb81177789b109b9e5e1548f86381"
  
  var value: String {
    return self.rawValue
  }
}

enum Endpoints: String {
  case nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?"
  case baseImageURL = "https://image.tmdb.org/t/p/w185"
  
  var value: String {
    return self.rawValue
  }
}

enum MovieDBError: Error {
  case invalidURL
  case invalidStatusCode
  case invalidData
}
