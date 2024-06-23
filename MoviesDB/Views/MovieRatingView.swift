//
//  MovieRatingView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MovieRatingView: View {
  var movie: Movie
  var body: some View {
    
    let intValue: Int = Int(movie.voteAverage * 10)
    
    ZStack {
      circularProgressView(movie: movie)
        .frame(width: 56 , height: 56)
      Text("\(intValue)")
        .foregroundColor(.white)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    }
  }
}

struct circularProgressView: View {
  
  //let progress: CGFloat
  @State var movie: Movie
  
  var body: some View {
    ZStack {
      //background for the progress bar
      Circle()
        .stroke(lineWidth: 12)
        .opacity(0.1)
        .foregroundColor(.green)
      //Fore ground = actual bar
      Circle()
        .trim(from: 0.0, to: min(1.0, movie.voteAverage / 10.0))
        .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .butt, lineJoin: .round))
        .foregroundColor(.green)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear, value: movie.voteAverage)
    }
    .background(.black)
    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    
  }
}

#Preview {
    MovieRatingView(movie: previewMovie)
}
