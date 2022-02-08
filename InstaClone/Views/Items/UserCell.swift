//
//  UserCell.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/3/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("rian")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            //VStack -> Username, Fullname
            VStack(alignment: .leading) {
                Text("rian")
                    .font(.system(size: 14, weight: .semibold))
                Text("Rian Harshaw")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
