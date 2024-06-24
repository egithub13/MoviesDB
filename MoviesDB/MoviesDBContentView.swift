//
//  MoviesDBContentView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MoviesDBContentView: View {
  
  @StateObject private var viewModel = MovieDBViewModel()
  private var defaultMovies: [Movie] = []
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 48) {
          ForEach(viewModel.movieData ?? defaultMovies) { movie in
            MovieCardView(movie: movie)
          }
        }
        .task {
          do {
            viewModel.movieData = try await MovieDBViewModel.fetchMovieData()
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
      .navigationTitle("Movies")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  MoviesDBContentView()
}




