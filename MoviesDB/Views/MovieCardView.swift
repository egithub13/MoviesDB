//
//  MovieCardView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MovieCardView: View {
  var baseImageURL: String
  var imageURL: String
  var body: some View {
    ZStack {
      VStack(alignment: .leading, spacing: 16.0) {
        AsyncImage(url: URL(string: baseImageURL + imageURL)) { image in
          image.resizable()
        } placeholder: {
          ProgressView()
            .controlSize(.large)
        }
        .frame(width: 180, height: 220)
        cardText()
      }
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 12.0))
      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
      MovieRatingView()
      EllipsisView()
    }
  }
  
  struct cardText: View {
    
    var body: some View {
      VStack(alignment: .leading) {
        Text("Movie Title")
          .font(.headline)
        Text("Release Date:")
          .font(.headline)
          .foregroundStyle(.secondary)
      }
      .padding(.top, 32)
      .padding(.bottom, 32)
      .padding(.horizontal, 8)
    }
  }
}

#Preview {
    MovieCardView(baseImageURL: "https://image.tmdb.org/t/p/w185", imageURL: "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg")
}
