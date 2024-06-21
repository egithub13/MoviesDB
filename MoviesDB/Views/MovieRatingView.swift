//
//  MovieRatingView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct MovieRatingView: View {
  var body: some View {
    ZStack {
      Text("79")
        .padding()
        .background(Circle().stroke(Color.white, lineWidth: 3))
        .padding(4)
        .background(Circle().fill(Color.black))
        .foregroundStyle(.white)
        .padding(.trailing, 100)
        .padding(.top, 100)
      circularProgressView(progress: 0.80)
        .frame(width: 56 , height: 56)
        .padding(.trailing, 100)
        .padding(.top, 100)
      
    }
  }
}

struct circularProgressView: View {
  
  let progress: CGFloat
  
  var body: some View {
    ZStack {
      //background for the progress bar
      Circle()
        .stroke(lineWidth: 6)
        .opacity(0.1)
        .foregroundColor(.blue)
      //Fore ground = actual bar
      Circle()
        .trim(from: 0.0, to: min(progress, 1.0))
        .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear, value: progress)
    }
  }
}

#Preview {
    MovieRatingView()
}
