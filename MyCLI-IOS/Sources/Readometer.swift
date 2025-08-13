// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation


import Foundation

struct DesktopAdminTools {
    
    func showMenu() {
        print("Select a desktop admin tool:")
        print("1. Disk Utility")
        print("2. Activity Monitor")
        print("3. Network Utility")
        print("4. System Preferences")
        print("5. Quit")
    }
    
    func showHelp() {
        print("Desktop Admin Tools")
        print("This command-line tool provides access to various desktop administration utilities on macOS.")
        print("Usage:")
        print("1. Select an option number (1-5) to run a specific utility.")
        print("2. Option 6: Quit the program.")
        print("3. Option 5: Display this help information.")
    }
    
    
    func runProcess(launchPath: String, arguments: [String]) {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print(output)
        }
    }
    
    func runDiskUtility() {
        runProcess(launchPath: "/bin/df", arguments: ["-h"])
    }
    
    func runActivityMonitor() {
        runProcess(launchPath: "/usr/bin/top", arguments: ["-l", "1", "-n", "10", "-stats", "pid,command,cpu,time"])
    }
    
    func runNetworkUtility() {
        runProcess(launchPath: "/usr/sbin/netstat", arguments: ["-an"])
    }
    
    func runSystemPreferences() {
        let task = Process()
           task.launchPath = "/usr/bin/open"
           task.arguments = ["-a", "System Preferences"]
           task.launch()
    }
    
    func exitAdminTool() {
        exit(0)
    }
    
    
    func runTool(option: Int) {
        switch option {
        case 1:
            runDiskUtility()
        case 2:
            runActivityMonitor()
        case 3:
            runNetworkUtility()
        case 4:
            runSystemPreferences()
        case 5:
            exitAdminTool()
            return
        default:
            print("Invalid option. Try again")
        }
    }
}

@main
struct AdminTool {
    static func main() {
        let desktopAdminTools = DesktopAdminTools()
        while true {
            desktopAdminTools.showMenu()
            print("Enter option number (1-6): ", terminator: "")
            if let input = readLine(), let option = Int(input) {
                desktopAdminTools.runTool(option: option)
                print("Ran option\(option)")
            } else {
                print("Invalid input. Please enter a number.")
            }
        }
    }
}

