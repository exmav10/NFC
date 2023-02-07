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

    private var nfcSession: NFCTagReaderSession?

    override init() {
        super.init()
    }

    func startNFCSession() {
        nfcSession = NFCTagReaderSession(pollingOption: [.iso14443], delegate: self, queue: nil)
        nfcSession?.alertMessage = "Hold your iPhone near the item to learn more about it."
        nfcSession?.begin()
    }
}

extension CardListViewModel: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {}
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("Session did invalidatewitherror \(error.localizedDescription)")
        self.nfcSession?.invalidate()
        self.nfcSession = nil
        // TODO: Show error popup
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        guard let tag = tags.first else { return }
        tag
        Task { [tag] in
            do {
                try await session.connect(to: tag)
                print("tagReaderSession:connected to tag - starting authentication")
                self.nfcSession?.alertMessage = "Starting authentication"
//                let tagReader = TagReader(tag: passportTag)
//                if let newAmount = self.dataAmountToReadOverride {
//                    tagReader.overrideDataAmountToRead(newAmount: newAmount)
//                }
                
                
                
            } catch let error {
                print("The reader session error: \(error)")
            }
        }
    }

    func updateReaderSessionMessage(_ alertMessage: String ) {
        self.nfcSession?.alertMessage = alertMessage
    }
}
