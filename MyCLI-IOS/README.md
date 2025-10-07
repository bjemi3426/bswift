# 💻 Desktop Admin Tools

### Overview
**Desktop Admin Tools** is a Swift command-line tool for macOS that provides quick access to common system utilities.  
It demonstrates basic CLI development in Swift using **ArgumentParser**, **Process**, and **Foundation** frameworks.

---

### ✨ Features
- 🖥️ View disk usage (`df -h`)  
- ⚡ Monitor CPU processes (`top`)  
- 🌐 Check network connections (`netstat`)  
- ⚙️ Open System Preferences  
- ❌ Exit the tool gracefully  

---

### 🧰 Tech Stack
| Category | Details |
|----------|---------|
| **Language** | Swift |
| **Frameworks** | Foundation, ArgumentParser |
| **Platform** | macOS |
| **Type** | Command-Line Tool (CLI) |
| **Architecture** | Struct-based, procedural flow with `while true` loop |

---

### 🧩 Components
| Component | Description |
|-----------|-------------|
| `DesktopAdminTools` | Main struct containing the menu, helper functions, and process execution logic. |
| `runProcess()` | Executes shell commands via `Process` and prints results. |
| `runTool(option:)` | Switch-case to map menu options to system utilities. |
| `AdminTool` | `@main` struct that starts the CLI loop and handles user input. |

---

### 🧠 Notable Implementations
- **Process Execution:** Runs native macOS commands from Swift.  
- **Loop & Input Handling:** Uses `while true` and `readLine()` for continuous menu interaction.  
- **Cross-Utility Access:** Single tool to launch disk, CPU, network, and system preference utilities.  

---

### 🚀 Future Improvements
- Integrate **ArgumentParser** for named arguments and flags.  
- Add error handling for failed processes.  
- Include logging of output to a file.  
- Add color-coded CLI output for better readability.  
- Optionally add custom utilities or scripts.  

---

