//
//  EllipsisView.swift
//  MoviesDB
//
//  Created by eric hayes on 6/19/24.
//

import SwiftUI

struct EllipsisView: View {
  var body: some View {
    Image(systemName: "ellipsis")
      .frame(width: 24, height: 24)
      .background(.gray)
      .cornerRadius(12)
  }
}


#Preview {
    EllipsisView()
}
