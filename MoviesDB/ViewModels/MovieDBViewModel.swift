//
//  MovieDBViewModel.swift
//  MoviesDB
//
//  Created by eric hayes on 6/22/24.
//

import Foundation

class MovieDBViewModel: ObservableObject {
  
  @Published var movieData: [Movie]? = []
  
  init() {
    
  }
  
  static func fetchMovieData() async throws -> [Movie]? {
    let endpoint = Endpoints.nowPlaying.value + APIKeys.movieDB.value
    
    guard let url = URL(string: endpoint) else {
      throw MovieDBError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw MovieDBError.invalidStatusCode
    }
    
    do {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let movies = try decoder.decode(MovieResponse.self, from: data)
      return movies.results
    } catch {
      throw MovieDBError.invalidData
    }
  }
}
