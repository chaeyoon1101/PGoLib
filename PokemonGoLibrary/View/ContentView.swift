import SwiftUI


struct PokemonViewTypeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 110, height: 110)
            .background(Color.lightBlue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .opacity(configuration.isPressed ? 0.8 : 1)
            .padding(4)
    }
}

struct ContentView: View {
    @StateObject var dataModel = DataModel()
    
    @State var path: [PokemonViewType] = []
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Button("포켓몬 도감") {
                        path.append(.libraryView)
                    }
                    .buttonStyle(PokemonViewTypeButtonStyle())
                    
                    Button("포켓몬 레이드 티어") {
                        path.append(.raidTierView)
                    }
                    .buttonStyle(PokemonViewTypeButtonStyle())
                    
                    Button("포켓몬 상성") {
                        path.append(.counterTypeView)
                    }
                    .buttonStyle(PokemonViewTypeButtonStyle())
                }
                HStack {
                    Button("배틀리그 티어") {
                        path.append(.battleTierView)
                    }
                    .buttonStyle(PokemonViewTypeButtonStyle())
                }
            }
            
            .font(.headline)
            .bold()
            .navigationDestination(for: PokemonViewType.self) { pokemonViewType in
                switch pokemonViewType {
                case .libraryView:
                    PokemonLibraryView()
                case .raidTierView:
                    PokemonTierView()
                case .counterTypeView:
                    PokemonCounterTypeView()
                case .battleTierView:
                    PokemonBattleTierView()
                }
            }
        }
        .onAppear {
            Task {
                await dataModel.fetchDatas()
            }
        }
        .environmentObject(dataModel)
    }
}

#Preview {
    ContentView()
}
