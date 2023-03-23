// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/PianoRoll/
// PianoRollNote.swift
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
        self.note = Pitch(intValue: max(0, pitch)).note(in: key)
        self.text = note.description
        self.color = Color(cgColor: Self.colorMap[Int(note.pitch.pitchClass)])

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
            note = Pitch(intValue: max(0, pitch)).note(in: key)
            text = note.description
            color = Color(cgColor: Self.colorMap[Int(note.pitch.pitchClass)])

        }
    }

    /// Abstract pitch, not MIDI notes.
    public var pitch: Int {
        mutating didSet {
            note = Pitch(intValue: max(0, pitch)).note(in: key)
            text = note.description
            color = Color(cgColor: Self.colorMap[Int(note.pitch.pitchClass)])

//            let oct = (note.pitch.midiNoteNumber / 127).clamped(to: 0...1)
//            let col = PitchColor.jameson[Int(note.pitch.pitchClass)].components!
//            let cgCol = CGColor(red: col[0], green: col[1], blue: col[2], alpha: max(0.1, CGFloat(oct)))
//            color = Color(cgColor: cgCol)

        }
    }
    
    /// The abstract pitch that has been quantized to a concrete Note in the current musical Key.
    public private(set) var note: Note
    
    /// The array of 12 colors to use for mapping pitches (0 - 127) into pitch classes
    public static var colorMap: [CGColor] = PitchColor.jameson

    /// Optional text shown on the note view
    public var text: String?
    /// Individual note color. It will default to `noteColor` in `PianoRoll` if not set.
    public var color: Color?
}
