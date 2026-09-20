import SwiftUI

struct ContentView: View {
  @State private var showingWelcomeCover: Bool = true

  var body: some View {
    NavigationStack {
      List {
        Section {
          Text("Insights")
        }
        Section {
          Text("Places")
        }
        Section(
          header:
            HStack {
              Text("Journals")
              Spacer()
              Button("Add", systemImage: "plus") {
                //
              }
              .controlSize(.small)
              .buttonStyle(.bordered)
              .buttonBorderShape(.circle)
              .foregroundStyle(.black)
              .labelStyle(.iconOnly)
            }
        ) {
          ForEach(1..<6, id: \.self) { i in
            Text("Journal \(i)")
          }
        }
      }
      .listSectionSpacing(.custom(15))
      .sheet(
        isPresented: $showingWelcomeCover,
        onDismiss: { showingWelcomeCover = false }
      ) {
        WelcomeView()
          .padding(.top, 20)
      }
      .toolbar {
        Menu("More", systemImage: "ellipsis") {
          Button("Edit", systemImage: "pencil") {}
          Divider()
          Button("Health Access", systemImage: "brain.filled.head.profile") {}
          Button("Notifications", systemImage: "bell") {}
          Button("Lock Journal", systemImage: "lock") {}
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
