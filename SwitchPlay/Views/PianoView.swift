import AVFoundation
import SwiftUI

struct PianoView: View {
  @StateObject private var instrument = ToneInstrument()

  private let notes: [(name: String, frequency: Double)] = [
    ("C4", 261.63),
    ("D4", 293.66),
    ("E4", 329.63),
    ("F4", 349.23),
    ("G4", 392.00),
    ("A4", 440.00),
    ("B4", 493.88),
    ("C5", 523.25),
  ]

  var body: some View {
    VStack(spacing: 20) {
      Text("Choose a piano note")
        .font(.title2.bold())
      Text("Select a key to hear its sound.")
        .foregroundStyle(.secondary)

      LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
        ForEach(notes, id: \.name) { note in
          Button {
            instrument.play(frequency: note.frequency)
          } label: {
            Text(note.name)
              .font(.title2.bold())
              .frame(maxWidth: .infinity, minHeight: 76)
              .background(Color.blue.opacity(0.14), in: RoundedRectangle(cornerRadius: 14))
          }
          .buttonStyle(.plain)
          .accessibilityLabel("Piano note \(note.name)")
          .accessibilityHint("Plays the \(note.name) note.")
        }
      }

      Button("Stop sound", systemImage: "stop.fill") {
        instrument.stop()
      }
      .accessibilityHint("Stops the currently playing note.")

      Spacer()
    }
    .padding()
    .navigationTitle("Music Studio")
    .navigationBarTitleDisplayMode(.inline)
    .onDisappear { instrument.stop() }
  }
}

@MainActor
final class ToneInstrument: ObservableObject {
  private let engine = AVAudioEngine()
  private let player = AVAudioPlayerNode()
  private var isReady = false

  func play(frequency: Double) {
    do {
      try prepareIfNeeded()
      player.stop()

      let sampleRate = 44100.0
      let duration = 0.65
      let frameCount = AVAudioFrameCount(sampleRate * duration)
      guard let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1),
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount),
        let channel = buffer.floatChannelData?[0]
      else {
        return
      }

      buffer.frameLength = frameCount
      for frame in 0..<Int(frameCount) {
        let time = Double(frame) / sampleRate
        let fadeIn = min(1.0, time / 0.015)
        let fadeOut = min(1.0, (duration - time) / 0.12)
        let envelope = max(0, min(fadeIn, fadeOut))
        channel[frame] = Float(sin(2.0 * .pi * frequency * time) * 0.22 * envelope)
      }

      player.scheduleBuffer(buffer)
      player.play()
    } catch {
      // Audio setup errors should not prevent the rest of the app from working.
    }
  }

  func stop() {
    player.stop()
  }

  private func prepareIfNeeded() throws {
    guard !isReady else { return }
    let session = AVAudioSession.sharedInstance()
    try session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
    try session.setActive(true)
    engine.attach(player)
    engine.connect(player, to: engine.mainMixerNode, format: nil)
    try engine.start()
    isReady = true
  }
}
