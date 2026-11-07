import SwiftUI

enum Activity: String, CaseIterable, Identifiable {
  case matching = "Matching"
  case memory = "Memory"
  case causeEffect = "Cause and Effect"
  case puzzles = "Puzzles"
  case sequencing = "Sequencing"
  case creative = "Creative"
  case music = "Music Studio"

  var id: String { rawValue }

  var symbol: String {
    switch self {
    case .matching:
      return "square.grid.2x2"
    case .memory:
      return "brain"
    case .causeEffect:
      return "sparkles"
    case .puzzles:
      return "puzzlepiece"
    case .sequencing:
      return "list.number"
    case .creative:
      return "paintpalette"
    case .music:
      return "music.note"
    }
  }

  var description: String {
    switch self {
    case .matching:
      return "Match pictures and objects."
    case .memory:
      return "Find matching pairs."
    case .causeEffect:
      return "Choose an object and see what happens."
    case .puzzles:
      return "Solve puzzles using select-and-place interactions."
    case .sequencing:
      return "Complete patterns and sequences."
    case .creative:
      return "Choose colors, shapes, and stickers."
    case .music:
      return "Play notes and explore musical sounds."
    }
  }
}
