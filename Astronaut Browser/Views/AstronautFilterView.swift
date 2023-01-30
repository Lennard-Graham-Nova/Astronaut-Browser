//
//  AstronautFilterView.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 28/01/2023.
//

import SwiftUI

struct AstronautFilterView: View {
    
    @ObservedObject private var viewModel: AstronautViewViewModel
    
    init(viewModel: AstronautViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        picker
    }
    
    private var picker: some View {
        Picker("Choose a filter", selection: $viewModel.selectedStatus) {
            ForEach(StatusEnum.allCases, id: \.self) {
                Text($0.name)
            }
        }
    }
}

struct AstronautFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautFilterView(viewModel: .init())
    }
}
