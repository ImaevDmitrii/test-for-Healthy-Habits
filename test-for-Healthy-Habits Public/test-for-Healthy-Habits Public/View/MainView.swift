//
//  MainView.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI
import CoreData

struct MainView: View {
    @EnvironmentObject var userSettings: UserSettings
    @StateObject private var viewModel: AffirmationViewModel
    @State private var showSettings = false
    
    init(viewContext: NSManagedObjectContext, userSettings: UserSettings) {
        _viewModel = StateObject(wrappedValue: AffirmationViewModel(viewContext: viewContext, userSettings: userSettings))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(userSettings.selectedBackgroundColor.color)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    if !viewModel.affirmations.isEmpty {
                        Text(viewModel.affirmations[viewModel.currentAffirmationIndex].text)
                            .padding()
                            .background(Color(userSettings.selectedBackgroundColor.color))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    } else {
                        Text(LocalizedStrings.noAffirmationsAvailable)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                showSettings.toggle()
            }) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.primary)
            })
            .sheet(isPresented: $showSettings) {
                NavigationView {
                    SettingsView()
                        .environmentObject(userSettings)
                        .navigationBarItems(trailing: Button(LocalizedStrings.doneButton) {
                            showSettings = false
                            viewModel.fetchAffirmations()
                        })
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.height < 0 {
                            viewModel.nextAffirmation()
                        } else {
                            viewModel.previousAffirmation()
                        }
                    }
            )
            .onAppear {
                viewModel.fetchAffirmations()
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(viewModel, name: .settingsDidChange, object: nil)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let persistenceController = PersistenceController.shared
    
    static var previews: some View {
        MainView(viewContext: persistenceController.container.viewContext, userSettings: UserSettings())
            .environmentObject(UserSettings())
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
