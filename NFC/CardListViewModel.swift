//
//  CardListViewModel.swift
//  NFC
//
//  Created by Aydın ÜNAL on 5.01.2023.
//

import Foundation
import CoreNFC
import Combine

final class CardListViewModel: NSObject, ObservableObject {

    private var nfcSession: NFCNDEFReaderSession?

    override init() {
        super.init()
    }

    private func startNFCSession() {
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        nfcSession?.alertMessage = "Hold your iPhone near the item to learn more about it."
        nfcSession?.begin()
    }
}

extension CardListViewModel: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("ERROR ON READER SESSION")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("NFC IS DETECTED")
    }
}
