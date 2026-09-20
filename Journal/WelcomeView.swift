import SwiftUI

struct WelcomeView: View {
  @Environment(\.dismiss) var dismiss

  private var features: [(id: Int, icon: String, description: String)] = [
    (
      id: 1,
      icon: "person.fill",
      description: "Write about your day and add photos, places, a state of mind, and more."
    ),
    (
      id: 2,
      icon: "calendar.badge.clock",
      description: "Schedule time for writing, view journaling streaks, and make it a habit."
    ),
    (
      id: 3,
      icon: "lock.fill",
      description: "Securely sync entries using iCloud, and lock your journal to keep it private."
    ),
  ]

  var body: some View {
    VStack {
      Image("Icon")
        .resizable()
        .scaledToFit()
        .frame(width: 120)
        .padding(.vertical, 50)

      VStack(alignment: .leading) {
        Text("Welcome to")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(.accent)
        Text("Journal")
          .font(.largeTitle)
          .fontWeight(.bold)
        ForEach(features, id: \.id) { feature in
          HStack {
            Image(systemName: feature.icon)
              .font(.largeTitle)
              .foregroundStyle(.accent)
              .frame(width: 50, height: 50)
              .padding(.trailing, 5)
            Text(feature.description)
              .font(.title3)
              .fixedSize(horizontal: false, vertical: true)
              .opacity(0.7)
          }
          .padding(.vertical, 10)
        }
      }

      Spacer()

      Button {
        dismiss()
      } label: {
        Text("Continue")
          .frame(maxWidth: .infinity)
          .padding()
          .font(.headline)
          .foregroundStyle(.white)
          .background(.accent)
          .clipShape(.capsule)
      }
    }
    .padding(.horizontal, 30)
  }
}

#Preview {
  WelcomeView()
}
