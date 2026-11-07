import SwiftUI

struct MatchingView: View {
  private static let pairs = ["cat", "dog", "sun", "star"]
  @State private var cards: [MatchCard] = []
  @State private var firstChoice: UUID?
  @State private var matchedPairs: Set<String> = []
  @State private var message = "Choose two matching pictures."

  init() {
    _cards = State(initialValue: Self.makeCards())
  }

  var body: some View {
    VStack(spacing: 18) {
      Text("Find the matching pictures")
        .font(.title2.bold())
        .multilineTextAlignment(.center)

      Text(message)
        .font(.body)

      LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
        ForEach(cards) { card in
          Button {
            choose(card)
          } label: {
            VStack(spacing: 10) {
              Image(systemName: card.symbol)
                .font(.system(size: 42))
              Text(card.name.capitalized)
                .font(.headline)
            }
            .frame(maxWidth: .infinity, minHeight: 112)
            .background(cardBackground(card), in: RoundedRectangle(cornerRadius: 16))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(
                  firstChoice == card.id ? Color.accentColor : .clear,
                  lineWidth: 4
                )
            )
          }
          .buttonStyle(.plain)
          .disabled(matchedPairs.contains(card.name))
          .accessibilityLabel(
            "\(card.name.capitalized)\(matchedPairs.contains(card.name) ? ", matched" : "")"
          )
          .accessibilityHint(
            matchedPairs.contains(card.name)
              ? "Already matched."
              : "Select to choose this picture."
          )
        }
      }

      Button("Start again", systemImage: "arrow.clockwise") {
        reset()
      }
      .accessibilityHint("Starts a new matching game.")
      .padding(.top, 8)

      Spacer(minLength: 0)
    }
    .padding()
    .navigationTitle("Matching")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func cardBackground(_ card: MatchCard) -> Color {
    matchedPairs.contains(card.name)
      ? Color.green.opacity(0.18)
      : Color.accentColor.opacity(0.10)
  }

  private func choose(_ card: MatchCard) {
    guard !matchedPairs.contains(card.name) else { return }

    if let firstID = firstChoice {
      guard firstID != card.id,
        let firstCard = cards.first(where: { $0.id == firstID })
      else {
        return
      }

      if firstCard.name == card.name {
        matchedPairs.insert(card.name)
        message =
          matchedPairs.count == Self.pairs.count
          ? "All pairs matched. Well done!"
          : "Match found!"
      } else {
        message = "Those pictures do not match. Try again."
      }
      firstChoice = nil
    } else {
      firstChoice = card.id
      message = "\(card.name.capitalized) selected. Choose another picture."
    }
  }

  private func reset() {
    cards = Self.makeCards()
    firstChoice = nil
    matchedPairs.removeAll()
    message = "Choose two matching pictures."
  }

  private static func makeCards() -> [MatchCard] {
    let symbols = [
      "cat": "cat.fill",
      "dog": "dog.fill",
      "sun": "sun.max.fill",
      "star": "star.fill",
    ]
    return (pairs + pairs).shuffled().map { name in
      MatchCard(name: name, symbol: symbols[name] ?? "circle")
    }
  }
}

private struct MatchCard: Identifiable {
  let id = UUID()
  let name: String
  let symbol: String
}
