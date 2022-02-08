//
//  SearchView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/26/22.
//

import SwiftUI

struct SearchView: View {
  @State var inSearchMode = false
  @State var searchText = ""
    
  var body: some View {
      ScrollView {
        Text("Search")
        
        // Search Bar
        SearchBar(text: $searchText, isEditing: $inSearchMode)
          .padding()
        
          ZStack {
              if inSearchMode {
                  UserListView()
              } else {
                  PostGridView()
              }
          }
      }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
