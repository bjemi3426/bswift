//
import SwiftUI
import UserNotifications

struct WaterReminderView: View {
    let plant: Plant
    @Environment(\.dismiss) private var dismiss
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Set Reminder for:")
                .font(.headline)
            
            DatePicker("Reminder Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                .labelsHidden()
                .datePickerStyle(.graphical)
            
            Button("Schedule Water Reminder") {
                
                NotificationManager.scheduleWateringNotification(for: plant, at: selectedDate)
                dismiss()
            }
            
            Text("Selected: \(selectedDate.formatted(date: .abbreviated, time: .standard))")
                .font(.subheadline)
        }
        .padding()
    }
}
