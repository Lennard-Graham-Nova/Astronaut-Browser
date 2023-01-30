//
//  AstronautListView.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 26/01/2023.
//

import SwiftUI

struct AstronautListView {
    
    @StateObject var viewModel: AstronautViewViewModel
    private let gridColumns = [GridItem(.flexible(), spacing: 24)]
    private let horizontalPadding: CGFloat = 16
    
    private func getAstronauts() {
        Task {
            await viewModel.getAstronauts()
        }
    }
}

extension AstronautListView: View {
    
    var body: some View {
        NavigationStack(path: $viewModel.astronoutPath) {
            VStack {
                filterView
                Rectangle()
                    .fill(.gray)
                    .frame(height: 2)
                scrollView
            }
            .background(Color.babyBlue)
        }
        .onChange(of: viewModel.selectedStatus) { status in
            viewModel.filter(status: status)
        }
        .onAppear {
            if !viewModel.hasInitialLoad {
                getAstronauts()
                viewModel.hasInitialLoad = true
            }
        }
    }
    
    private var scrollView: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            }
            ScrollView {
                lazyVGrid
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautDetailView(astronaut: astronaut)
            }
            .buttonStyle(.plain)
        }
    }
    
    private var lazyVGrid: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(Array(zip(viewModel.filteredAstronauts.indices, viewModel.filteredAstronauts)), id: \.1) { index, astronaut in
                NavigationLink(value: astronaut) {
                    AstronautCell(astronaut: astronaut)
                        .onAppear {
                            if viewModel.filteredAstronauts.count - viewModel.loadMoreOffSet == index {
                                getAstronauts()
                            }
                        }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
    
    private var filterView: some View {
        HStack {
            Spacer()
            AstronautFilterView(viewModel: viewModel)
                .padding(.trailing, horizontalPadding)
        }
    }
}

struct AstronautListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AstronautViewViewModel(network: MockNetwork())
        viewModel.loadMoreOffSet = -999
        return AstronautListView(viewModel: viewModel)
    }
}
