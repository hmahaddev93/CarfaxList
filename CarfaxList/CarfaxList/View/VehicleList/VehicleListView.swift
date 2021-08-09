//
//  ContentView.swift
//  CarfaxList
//
//  Created by Khateeb Mahad Hussain on 8/8/21.
//

import SwiftUI

struct VehicleListView: View {
    
    @ObservedObject var viewModel:VehicleListViewModel = VehicleListViewModel()
    @EnvironmentObject var partialModalManager: PartialModalManager

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(viewModel.vehicles, id: \.id) { vehicle in
                    VehicleRowView(vehicle: vehicle) { email in
                        self.partialModalManager.showPartialModal({
                             print("Send email modal dismissed")
                        }) {
                             SendEmailView(toEmail: email)
                        }
                    }
                }
            }
            .padding(.top, 16)
        }
        .onAppear {
            viewModel.fetchVehicles()
        }
        .alert(isPresented: viewModel.isPresentingAlert, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.activeError!.localizedDescription),
                  dismissButton: .cancel())
        })
        .background(Color.white95)
        .addPartialModal()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}
