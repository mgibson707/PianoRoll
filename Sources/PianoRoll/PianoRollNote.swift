// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/PianoRoll/

import SwiftUI
import Tonic

/// Individual note displayed on the PianoRoll
public struct PianoRollNote: Equatable, Identifiable {
    /// Initialize the PianoRollNote with start time, duration, and pitch
    /// - Parameters:
    ///   - start: The start step
    ///   - length: Duration, measured in steps
    ///   - pitch: Abstract pitch, not MIDI notes.
    ///   - text: Optional text shown on the note view.
    ///   - color: Individual note color. It will default to `noteColor` in `PianoRoll` if not set.
    public init(start: Double, length: Double, pitch: Int, text: String? = nil, color: Color? = nil, key: Key = .C) {
        self.start = start
        self.length = length
        self.pitch = pitch
        self.color = color
        self.key = key
        self.text = Pitch(intValue: max(0, pitch - 1)).note(in: key).description

    }

    /// Unique Identifier
    public var id = UUID()

    /// The start step
    public var start: Double

    /// Duration, measured in steps
    public var length: Double
    
    /// The current key that the composition is in
    public var key: Key {
        mutating didSet {
            text = Pitch(intValue: max(0, pitch - 1)).note(in: key).description
        }
    }

    /// Abstract pitch, not MIDI notes.
    public var pitch: Int {
        mutating didSet {
            text = Pitch(intValue: max(0, pitch - 1)).note(in: key).description
        }
    }

    /// Optional text shown on the note view
    public var text: String?
    /// Individual note color. It will default to `noteColor` in `PianoRoll` if not set.
    public var color: Color?
}
