//
//  ShowVolumeIntent.swift
//  AppIntentUnitVolumeBugUnderEnGB
//
//  Created by Gong Zhang on 2023/9/22.
//

import SwiftUI
import AppIntents

struct ShowVolumeIntent: AppIntent {
    
    static let title: LocalizedStringResource = "Show Volume"
    
    static var parameterSummary: some ParameterSummary {
        Summary("\(\.$amount)")
    }
    
    @Parameter(title: "Amount")
    var amount: Measurement<UnitVolume>
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
        return .result(dialog: "\(formatter.string(from: amount))")
    }
    
}
