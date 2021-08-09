//
//  SendEmailView.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 8/8/21.
//

import SwiftUI

struct SendEmailView: View {
    let toEmail: String
    @State private var emailAddress: String = ""
    @State private var shortMsg: String = ""
    @EnvironmentObject var partialModalManager : PartialModalManager
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.partialModalManager.closePartialModal()
                }) {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                }
            }
            
            Text("Send Email to " + toEmail)
                .font(.headline)
                .padding()
            TextField("Your email", text: self.$emailAddress)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(UIColor.systemGray2), lineWidth: 1)
            )
            TextField("Shor message", text: self.$shortMsg)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(UIColor.systemGray2), lineWidth: 1)
            )
            
            Button(action: {
                if let url = URL(string: "mailto:\(toEmail)") {
                  if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                  } else {
                    UIApplication.shared.openURL(url)
                  }
                }
            }) {
                Text("Send")
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()

    }
}
