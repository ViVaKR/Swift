import SwiftUI

struct ContentView: View {
    let rate = 3.141592
    var rate2: Double = 0

    init() {
        self.rate2 = rate * rate
    }

    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
}
