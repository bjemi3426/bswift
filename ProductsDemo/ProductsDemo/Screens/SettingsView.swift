
import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedCurrency = "USD"
    @State private var selectedLanguage = "English"
    
    let currencies = ["USD", "EUR", "GBP", "JPY"]
    let languages = ["English", "Spanish", "French", "German"]
    
    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("General")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell")
                    }
                    
                    Toggle(isOn: $darkModeEnabled) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Picker(selection: $selectedCurrency, label: Label("Currency", systemImage: "dollarsign.circle")) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency)
                        }
                    }
                    
                    Picker(selection: $selectedLanguage, label: Label("Language", systemImage: "globe")) {
                        ForEach(languages, id: \.self) { language in
                            Text(language)
                        }
                    }
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: Text("App Version 1.0.0")) {
                        Label("Version", systemImage: "info.circle")
                    }
                    
                    NavigationLink(destination: Text("© 2025 ProductsDemo Inc.")) {
                        Label("Licenses", systemImage: "doc.text")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
