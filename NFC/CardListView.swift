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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(viewModel: CardListViewModel())
    }
}
