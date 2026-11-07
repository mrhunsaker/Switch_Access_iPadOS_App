# Development environment setup

## Platform requirement
SwitchPlay is a native SwiftUI iPadOS app. Building, signing, and deploying require macOS, Xcode, and the iPadOS SDK. Windows can edit files and manage Git, but cannot run Xcode or perform the native build.

## Required tools
- A Mac that supports a current Xcode release.
- Xcode installed and launched at least once.
- XcodeGen and Git.
- An iPad for physical-device validation.
- Compatible external switch hardware and interface for Switch Control testing.

## Clone and generate
```sh
git clone https://github.com/mrhunsaker/Switch_Access_iPadOS_App.git
cd Switch_Access_iPadOS_App
brew install xcodegen
xcodegen generate
open SwitchPlay.xcodeproj
```

In Xcode:
1. Select the app target.
2. Open Signing & Capabilities and select a development Team.
3. Replace the example bundle identifier `org.example.SwitchPlay` with one you control in `project.yml`.
4. Regenerate the project after changing the specification.
5. Select the connected iPad and build/run.

## What to commit
Commit source, project specifications, documentation, and reproducible configuration. Never commit signing credentials, provisioning profiles, private certificates, personal Xcode state, or secrets. Do not commit generated Xcode project files unless the project deliberately adopts that workflow.

## Windows-based contribution
Windows can edit Swift, Markdown, JSON, and YAML; manage Git; and submit issues and pull requests. It cannot verify iPadOS compilation or physical Switch Control behavior.

## Documentation preview
Install Python 3.10 or later:

```sh
python -m pip install -r requirements-docs.txt
mkdocs serve
mkdocs build --strict
```

Open the local URL printed by MkDocs, normally `http://127.0.0.1:8000`.
