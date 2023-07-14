//
//  CardListViewModel.swift
//  NFC
//
//  Created by Aydın ÜNAL on 12.02.2023.
//

import Foundation
import CoreNFC

final class CardListViewModel: NSObject, ObservableObject {
    private var session: NFCTagReaderSession?
    private var passportReader: PassportReader = PassportReader()

    func read() {
        session = NFCTagReaderSession(pollingOption: [.iso14443], delegate: self)
        session?.alertMessage = "Hold your phone near the NFC tag"
        session?.begin()
//        Task {
//            let customMessageHandler : (NFCViewDisplayMessage)->String? = { (displayMessage) in
//                switch displayMessage {
//                    case .requestPresentPassport:
//                        return "Hold your iPhone near an NFC enabled passport."
//                    default:
//                        // Return nil for all other messages so we use the provided default
//                        return nil
//                }
//            }
//            let passport = try await passportReader.readPassport(mrzKey: "", customDisplayMessage: customMessageHandler)
//        }
    }
}

extension CardListViewModel: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Session Begun!")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("Error with Launching Session")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("girdik")
        guard let tag = tags.first else { return }
        print(tag)
        print(tag.isAvailable)
        session.connect(to: tag) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.session?.alertMessage = error.localizedDescription
            }
//            if case let .miFare(sTag) = tag {
//                let UID = sTag.identifier.map { String(format: "%.2hhx", $0)}.joined()
//                print("UID: ", UID)
//                print("Tag identifier: ", sTag.identifier)
//                session.alertMessage = "UID is captured"
//                session.invalidate()
//            }
        }
    }
}
