//
//  ContentData.swift
//  PictureVault
//
//  Created by Bjem on 8/13/25.
//

import Foundation
import SwiftUI

class ContentDataViewModel: ObservableObject {
    @Published var openimagePicker: Bool = false
    @Published var picture: UIImage?
   }
