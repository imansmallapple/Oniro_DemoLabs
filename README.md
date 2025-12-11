# Oniro DemoLabs

[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-6.0.1-blue.svg)](https://developer.huawei.com/consumer/cn/harmonyos/)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](./LICENSE)

A collection of HarmonyOS application development example projects, including location service demo applications and common utility libraries.

## 📋 Project Overview

This project is a demonstration laboratory for HarmonyOS application development, containing the following modules:

- **locationDemo** - Location service example application demonstrating how to use HarmonyOS location positioning features
- **shared_lib** - Common utility library providing logging, file operations, image processing, permission management, and more

## 🏗️ Project Structure

```
demoLabs/
├── AppScope/                    # Application global configuration
│   ├── app.json5               # Application configuration file
│   └── resources/              # Global resource files
├── codeDemos/                   # Example code collection
│   └── locationDemo/           # Location service example
│       ├── src/
│       │   └── main/
│       │       ├── ets/
│       │       │   ├── applicationability/
│       │       │   ├── common/
│       │       │   └── pages/
│       │       └── resources/
│       └── build-profile.json5
├── shared_lib/                  # Common utility library
│   ├── src/
│   │   └── main/
│   │       └── ets/
│   │           ├── components/  # Common components
│   │           ├── helpers/     # Helper classes (media processing, etc.)
│   │           ├── models/      # Data models
│   │           ├── storage/     # Data storage
│   │           └── utils/       # Utility classes
│   ├── Index.ets               # Library export entry
│   ├── README.md               # Library detailed documentation
│   └── build-profile.json5
├── build-profile.json5          # Project build configuration
├── hvigorfile.ts               # Hvigor build script
└── oh-package.json5            # Project dependency configuration
```

## 🚀 Quick Start

### Requirements

- **DevEco Studio**: 5.0.0 or higher
- **HarmonyOS SDK**: API 21 (6.0.1) or higher
- **Node.js**: LTS version recommended

### Installation Steps

1. **Clone the project**
   ```bash
   git clone https://github.com/imansmallapple/Oniro_DemoLabs.git
   cd demoLabs
   ```

2. **Open project with DevEco Studio**
   - Launch DevEco Studio
   - Select "Open" to open the project directory
   - Wait for project synchronization and indexing to complete

3. **Install dependencies**
   ```bash
   ohpm install
   ```

4. **Build the project**
   ```bash
   hvigorw clean --mode module -p product=default assembleHap
   ```

### Run the Application

1. Connect a HarmonyOS device or launch an emulator
2. Click the run button in DevEco Studio
3. Select the target device and run

## 📱 Module Introduction

### LocationDemo - Location Service Example

Demonstrates how to use location positioning services in HarmonyOS applications.

**Main Features:**
- ✅ Get device current location
- ✅ Location permission request and management
- ✅ Coordinate format conversion (DMS format)
- ✅ Location service status detection

**Required Permissions:**
- `ohos.permission.LOCATION` - Precise location permission
- `ohos.permission.APPROXIMATELY_LOCATION` - Approximate location permission

**Example Code:**
```typescript
import { geoLocationManager } from '@kit.LocationKit';

// Get current location
let request: geoLocationManager.SingleLocationRequest = {
  'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED,
  'locatingTimeoutMs': 10000
}

geoLocationManager.getCurrentLocation(request).then((result) => {
  console.log('Current location: ' + JSON.stringify(result));
});
```

### Shared_lib - Common Utility Library

Provides a complete set of HarmonyOS application development tools.

**Core Features:**

- 📝 **Logger** - Unified logging management
- 📁 **FileUtil** - File operation utilities
- 🖼️ **ImageUtil** - Image processing utilities
- 🔐 **PermissionUtil** - Permission management
- 💾 **PreferenceStorage** - Key-value storage
- 📷 **MediaHelper** - Media selection and processing
- 🗄️ **KvStoreUtil** - Distributed key-value database
- 📱 **DeviceManager** - Device discovery and management
- 🔤 **StringUtil** - String processing utilities

For detailed usage documentation, please refer to [shared_lib/README.md](./shared_lib/README.md)

## 🔧 Development Guide

### Adding a New Example Module

1. Create a new module folder under the `codeDemos/` directory
2. Create necessary configuration files (`build-profile.json5`, `module.json5`)
3. Register the new module in the root `build-profile.json5`
4. Write example code

### Using Shared_lib

Add dependency in your module's `oh-package.json5`:

```json5
{
  "dependencies": {
    "@ohos/shared_lib": "file:../../shared_lib"
  }
}
```

Then import and use in your code:

```typescript
import { Logger, permissionUtil, PreferenceStorage } from '@ohos/shared_lib'
```

## 🐛 Troubleshooting

### Build Errors

**Issue: Schema validate failed**
- Check the syntax of `build-profile.json5` files
- Ensure JSON5 format is correct with no trailing commas

**Issue: Module not found**
- Make sure you have run `ohpm install`
- Verify module paths are correct
- Clean cache and rebuild: `hvigorw clean`

**Issue: File extension errors**
- Pay attention to distinguish between `.ets` and `.ts` files
- Specify the correct extension when importing

### Permission Issues

Make sure to properly declare required permissions in `module.json5`:

```json5
{
  "module": {
    "requestPermissions": [
      {
        "name": "ohos.permission.LOCATION",
        "reason": "$string:permission_reason",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "always"
        }
      }
    ]
  }
}
```

## 🤝 Contributing

Issues and Pull Requests are welcome!

## 📄 License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

## 👨‍💻 Author

- **GitHub**: [@imansmallapple](https://github.com/imansmallapple)
- **Repository**: [Oniro_DemoLabs](https://github.com/imansmallapple/Oniro_DemoLabs)


---

**Note**: This project is for learning and reference purposes only. Some features may need to be adjusted according to actual requirements.
