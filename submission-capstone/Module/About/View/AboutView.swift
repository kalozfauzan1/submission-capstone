//
//  AboutView.swift
//  submission-capstone
//
//  Created by MacbookPro13 on 02/01/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 20)
                Image("kaloz merah")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                Spacer(minLength: 20)
                Text("Nama: Kaloz Fauzan")
                    .font(.system(size: 16))
                Text("Email: kaloz.fauzan2@gmail.com")
                    .font(.system(size: 16))
            }
        }
    }
}
