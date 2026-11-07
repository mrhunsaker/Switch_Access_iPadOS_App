# Build and physical-device testing guide

## Why a Mac is required

Xcode, the iPadOS SDK, code signing, and native iPad deployment require macOS. Use a currently supported Xcode release compatible with the Mac and target iPadOS version; this repository does not pin a specific Xcode release. Windows is suitable for editing Swift source and managing Git, but it cannot compile or sign this native iPadOS project. The next step for a Windows-only workflow is to arrange access to a Mac (borrowed, personally owned, or a reputable hosted Mac environment).

## First build on macOS

1. Install Xcode from the Mac App Store and open it once.
2. Install XcodeGen and the repository's current Swift formatter. With Homebrew: `brew install xcodegen swift-format`. Check `swift-format --version` against the version recorded in the repository audit.
3. Clone the repository:
   ```sh
   git clone https://github.com/mrhunsaker/Switch_Access_iPadOS_App.git
   cd Switch_Access_iPadOS_App
   ```
4. Generate the Xcode project:
   ```sh
   xcodegen generate
   ```
5. Open it:
   ```sh
   open SwitchPlay.xcodeproj
   ```
6. Connect the iPad, select it as the run destination, and configure a development Team in Signing & Capabilities.
7. Replace `org.example.SwitchPlay` with a bundle identifier you control. The identifier is in `project.yml`; regenerate the project after changing it.
8. Build and run. Capture the full first compiler error and the Xcode/iPadOS versions if it fails.

Generated `.xcodeproj` files and user-specific Xcode state should not be committed unless the project later adopts a deliberate checked-in project-file workflow.

## Configure external switches

On the iPad:
1. Open Settings → Accessibility → Switch Control → Switches.
2. Add each physical switch using the device's supported switch interface.
3. Assign the intended actions:
   - Back: Move to Previous Item
   - Next: Move to Next Item
   - Select: Select Item
4. For the three-switch workflow, choose Manual Scanning.
5. Enable Switch Control and confirm the scanning cursor appears.

The app does not perform these settings changes and cannot read the assignments.

## Physical-device test sequence

### A. Touch baseline
- Launch the app.
- Open Matching and Music Studio.
- Use the standard navigation Back button to return.
- Complete a match and reset the game.
- Play several piano notes and stop sound.

### B. Three-switch manual scanning
- Move focus forward and backward through the home screen.
- Select Matching.
- Verify every card can be reached and selected independently.
- Select two same cards and two different cards; verify clear feedback.
- Use Start again.
- Return to the home screen using the app's Back navigation control.
- Open Music Studio; reach and select every piano note and Stop sound.
- Verify system scanning can move both forward and backward through the controls.

### C. Two-switch manual scanning
- Configure Next Item and Select Item.
- Repeat the same home, matching, piano, and navigation tasks.
- Note any controls that are difficult to reach or operate.

### D. One-switch auto scanning
- Configure the device's supported Select Item / Auto Scanning setup.
- Repeat the same tasks.
- Record scan timing, accidental selections, and whether the user can wait for the desired item.

### E. Audio and interruptions
- Verify piano sound is audible at a comfortable level.
- Verify Stop sound and leaving the screen stop playback.
- Test with the intended audio route and any relevant accessibility audio settings.
- Note behavior when audio is interrupted by another app or system event.

## Test record template

For each session record:
- Date and tester role (avoid recording student-identifying information in repository issues)
- iPad model and iPadOS version
- Switch interface and switch hardware
- Switch assignments and scanning style
- App build/commit tested
- Task and outcome
- Unexpected focus stops, missed selections, delays, speech issues, or audio issues
- Severity and proposed reproduction steps

Do not upload identifiable student information, videos, or personal data to public GitHub issues.

## Known limitations before first test

- This source has not yet been compiled with Xcode.
- The app has no automated UI or accessibility test target yet.
- A simulator can help with layout and basic interaction, but cannot prove physical switch behavior.
- The current matching and piano implementations are prototypes, not finished activities.
