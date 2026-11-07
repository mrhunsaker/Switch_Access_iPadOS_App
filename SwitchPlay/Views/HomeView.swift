import SwiftUI

struct HomeView: View {
    private let columns = [GridItem(.flexible(), spacing: 14),
                           GridItem(.flexible(), spacing: 14)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    VStack(spacing: 6) {
                        Text("SwitchPlay")
                            .font(.largeTitle.bold())
                        Text("Choose an activity")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 18)
                    .accessibilityElement(children: .combine)

                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(Activity.allCases) { activity in
                            NavigationLink(value: activity) {
                                ActivityTile(activity: activity)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel(activity.rawValue)
                            .accessibilityHint(activity.description)
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Activity.self) { activity in
                switch activity {
                case .matching:
                    MatchingView()
                case .music:
                    PianoView()
                default:
                    ComingSoonView(activity: activity)
                }
            }
        }
    }
}

private struct ActivityTile: View {
    let activity: Activity

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: activity.symbol)
                .font(.system(size: 34, weight: .medium))
                .accessibilityHidden(true)
            Text(activity.rawValue)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 118)
        .padding(12)
        .background(Color.accentColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 18))
        .contentShape(RoundedRectangle(cornerRadius: 18))
    }
}

private struct ComingSoonView: View {
    let activity: Activity

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: activity.symbol)
                .font(.system(size: 54))
                .accessibilityHidden(true)
            Text(activity.rawValue)
                .font(.largeTitle.bold())
            Text("This activity is planned for a later development phase.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle(activity.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}
