//
//  MoviesDBContentView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MoviesDBContentView: View {
  
  @State var moviesDB: [Movie]?
  var defaultMovies: [Movie] = []
  
  var body: some View {
    ScrollView {
      VStack(spacing: 48) {
        ForEach(moviesDB ?? defaultMovies) { movie in
          MovieCardView(movie: movie)
        }
      }
      .task {
        do {
          moviesDB = try await fetchMovieData()
        } catch MovieDBError.invalidURL {
          print("Invalid URL")
        } catch MovieDBError.invalidStatusCode {
          print("Invalid status code")
        } catch MovieDBError.invalidData {
          print("Invalid data")
        } catch {
          print("Unexpected error")
        }
    }
    }
  }
  
  func fetchMovieData() async throws -> [Movie]? {
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

#Preview {
  MoviesDBContentView()
}

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



