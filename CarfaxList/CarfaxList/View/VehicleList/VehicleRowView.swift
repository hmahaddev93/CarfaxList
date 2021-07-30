//
//  VehicleRowView.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 7/30/21.
//

import SwiftUI

struct VehicleRowView: View {
    let vehicle: Vehicle
    var body: some View {
        VStack(spacing: 12) {
            
            // Vehicle photo view
            if let largeImageUrlString = vehicle.images.large.first, let url = URL(string: largeImageUrlString) {
                AsyncImage(
                    url: url,
                    placeholder: {
                        Text("Loading photo...")
                            .padding()
                            .foregroundColor(.blue)
                    },
                    image: {
                        Image(uiImage: $0)
                            .resizable()
                    }
                )
            }
            else {
                Text("No photo")
                    .background(Color.gray)
            }
            
            HStack  {
                Text("\(vehicle.year) \(vehicle.make) \(vehicle.model) \(vehicle.trim)")
                    .font(.system(size: 14, weight: .semibold, design: .default))
                Spacer()
            }
            .padding(.horizontal, 12)

            HStack {
                Text(String(format: "$%.0f", vehicle.currentPrice))
                    .font(.system(size: 14, weight: .semibold, design: .default))
                Text(String(format:"|  %.0f Mi", vehicle.mileage))
                    .font(.system(size: 14, weight: .regular, design: .default))
                Text(String(format:"|  %@, %@", vehicle.dealer.city, vehicle.dealer.state))
                    .font(.system(size: 14, weight: .regular, design: .default))
                Spacer()
            }
            .padding(.horizontal, 12)

            Button(action: {
                let telephoneLinkString = "tel://\(vehicle.dealer.phone)"
                guard let url = URL(string: telephoneLinkString) else { return }
                UIApplication.shared.open(url)
            }) {
                Text("Call " + vehicle.dealer.phone)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.blue)
            }
            .padding(.vertical, 16)

        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 6)
        .padding(.horizontal, 16)
    }
    
}
