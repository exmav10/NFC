//
//  CardListView.swift
//  NFC
//
//  Created by Aydın ÜNAL on 5.01.2023.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject private var viewModel: CardListViewModel

    init(viewModel: CardListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("the result: ")
            Button("Read NFC Tag") {
                viewModel.read()
            }
            .font(.title)
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(viewModel: CardListViewModel())
    }
}
