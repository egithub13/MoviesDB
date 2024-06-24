//
//  MovieCardView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MovieCardView: View {
 
  var movie: Movie
  
  var body: some View {
    ZStack {
      VStack(alignment: .leading, spacing: 16.0) {
        AsyncImage(url: URL(string: Endpoints.baseImageURL.value + movie.posterPath)) { image in
          image
            .resizable()
            .scaledToFill()
        } placeholder: {
          ProgressView()
            .controlSize(.large)
        }
        .frame(width: 188, height: 220)
        MovieRatingView(movie: movie)
          .padding(.leading, 8)
          .padding(.top, -12)
        cardText(movie: movie)
          .padding(.leading, 8)
      }
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 12.0))
      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
      EllipsisView()
        .padding(.leading, 120)
        .padding(.bottom, 300)
    }
  }
  
  struct cardText: View {
    var movie: Movie
    var body: some View {
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.headline)
      
        Text(movie.releaseDate)
          .font(.headline)
          .foregroundStyle(.secondary)
        
      }
      .frame(width: 180, height: 54, alignment: .leading)
      .padding(.bottom, 32)
      
    }
  }
}


#Preview {
  MovieCardView(movie: previewMovie)
}

var previewMovie = Movie(id: 00001,
                      overview: "After their late former Captain is framed, Lowrey and Burnett try to clear his name, only to end up on the run themselves.",
                      posterPath: "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
                      releaseDate: "2024-06-05",
                      title: "Bad Boys: Ride or Die",
                      voteAverage: 7.149)
