//
//  MovieDBResponse.swift
//  MoviesDB
//
//  Created by eric hayes on 6/21/24.
//

import Foundation

struct MovieResponse: Decodable {
  var results: [Movie]
}
struct Movie: Identifiable, Decodable {
  var id: Int
  var overview: String
  var posterPath: String
  var releaseDate: String
  var title: String
  var voteAverage: CGFloat
}
