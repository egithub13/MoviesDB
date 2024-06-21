//
//  MoviesDBContentView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MoviesDBContentView: View {
  var baseImageURL = "https://image.tmdb.org/t/p/w185"
  var apeURL = "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg"
  var badBoysURL = "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg"
  var body: some View {
    HStack(spacing: 12) {
      MovieCardView(baseImageURL: baseImageURL, imageURL: apeURL)
      MovieCardView(baseImageURL: baseImageURL, imageURL: badBoysURL)
    }
  }
}

#Preview {
  MoviesDBContentView()
}






