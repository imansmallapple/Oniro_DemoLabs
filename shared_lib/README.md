# Common Kit - HarmonyOS Utility Library

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE)
[![Version](https://img.shields.io/badge/version-1.1.0-green.svg)](oh-package.json5)

A comprehensive utility library for HarmonyOS application development, providing logging, file operations, image processing, permission management, data storage, distributed KV store, device management, and more.

## ✨ Features

- 📝 **Logger** - Unified logging management with multi-level log output
- 📁 **File Utilities** - Common file operations like read, write, copy, and delete
- 🖼️ **Image Utilities** - Image selection, compression, and format conversion
- 🔐 **Permission Management** - Simplified permission checking and requesting
- 💾 **Data Storage** - Key-value storage based on Preferences
- 📷 **Media Helper** - Gallery, camera, and document selection operations
- 🗄️ **KV Store** - Distributed key-value database with sync capabilities
- 📱 **Device Manager** - Device discovery, pairing, and distributed ability management

## 📦 Installation

Add dependency to your HarmonyOS project module `entry/oh-package.json5`:

```json5
// oh-package.json5
{
  "dependencies": {
    "@ohos/shared_lib": "file:../shared_common_kit"
  }
}
```

Then run:
```bash
ohpm install
```

## 🚀 Usage Examples

### Logger

```typescript
import { Logger } from '@ohos/shared_lib'

// Basic logging
Logger.debug('MyTag', 'Debug message')
Logger.info('MyTag', 'Info message')
Logger.warn('MyTag', 'Warning message')
Logger.error('MyTag', 'Error message')

// Object output support
Logger.info('MyTag', 'User data:', { name: 'John', age: 30 })

// Set log level
Logger.LOG_LEVEL = Logger.LEVEL_INFO // Only output INFO and above
```

### Permission Management

```typescript
import { permissionUtil } from '@ohos/shared_lib'
import { Permissions } from '@kit.AbilityKit'

// Check permissions
const hasPermission = permissionUtil.checkPermissions([
  'ohos.permission.CAMERA',
  'ohos.permission.READ_MEDIA'
])

// Request permissions
try {
  await permissionUtil.requestPermissions([
    'ohos.permission.CAMERA'
  ])
  console.log('Permission granted')
} catch (error) {
  console.error('Permission denied')
}
```

### Data Storage

```typescript
import { PreferenceStorage } from '@ohos/shared_lib'

const storage = new PreferenceStorage()

// Store data
await storage.putValue('username', 'John')
await storage.putValue('theme', 'dark')

// Read data
const username = await storage.getValue('username')
console.log(username) // 'John'

// Flush to disk
await storage.flushAllData()
```

### Media Helper

```typescript
import { MediaHelper } from '@ohos/shared_lib'

const mediaHelper = new MediaHelper(context)

// Select image
const imageUri = await mediaHelper.selectImage()

// Convert to Base64
const base64String = await mediaHelper.convertImageToBase64()

// Select document
const docUri = await mediaHelper.selectDocument()
```

### String Utilities

```typescript
import { StringUtil } from '@ohos/shared_lib'

// Check if string is empty
StringUtil.isEmpty('') // true
StringUtil.isNotEmpty('hello') // true

// Check if string is null or empty
StringUtil.isNullOrEmpty(null) // true
StringUtil.isNotNullOrEmpty('hello') // true

// Convert Buffer to string
const str = StringUtil.arrayBuffer2String(arrayBuffer)
```

### KV Store (Distributed Storage)

```typescript
import { KvStoreUtil } from '@ohos/shared_lib'

const kvStore = new KvStoreUtil()

// Create KV store with change callback
kvStore.createKvStore(context, (data) => {
  console.log('Data changed:', data)
})

// Store data
kvStore.put('key', 'value')

// Store and sync to specific device
kvStore.put('key', 'value', deviceId)

// Listen for data changes
kvStore.setDataChangeListener((data) => {
  console.log('Data updated:', data)
})

// Remove listener
kvStore.removeDataChangeListener()
```

### Device Manager (Distributed Devices)

```typescript
import { DeviceManager } from '@ohos/shared_lib'

// Create device manager
await DeviceManager.createDeviceManager()

// Start device discovery
DeviceManager.startDeviceDiscovery()

// Get device list from AppStorage
const deviceList = AppStorage.get('deviceList')

// Authenticate and connect to device
DeviceManager.authenticateDevice(context, device, sharedList)

// Start remote ability
DeviceManager.startAbility(context, device, sharedList)

// Stop discovery
DeviceManager.stopDeviceDiscovery()

// Unbind device
DeviceManager.unbindDevice(deviceId)
```

## 📁 Project Structure

```
shared_common_kit/
├── Index.ets                 # Unified export entry
├── oh-package.json5          # Package configuration
├── README.md                 # Project documentation
└── src/main/ets/
    ├── models/               # Data models
    │   └── MediaBean.ets     # Media data model
    ├── helpers/              # Business helper classes
    │   └── MediaHelper.ts    # Media operation helper
    ├── storage/              # Storage related
    │   └── PreferenceStorage.ets  # Preference storage
    └── utils/                # Common utilities
        ├── Logger.ets        # Logger utility
        ├── FileUtil.ets      # File utility
        ├── ImageUtil.ets     # Image utility
        ├── PermissionUtil.ets # Permission utility
        ├── StringUtil.ets    # String utility
        ├── kvStoreUtil.ts    # Distributed KV store
        └── DeviceManager.ets # Device discovery and management
```

## 🛠️ API Documentation

### Logger

Static logger utility class providing hierarchical log output.

**Methods:**
- `static debug(tag: string, ...messages: any[])` - Debug log
- `static info(tag: string, ...messages: any[])` - Info log
- `static warn(tag: string, message: string | object)` - Warning log
- `static error(tag: string, ...messages: any[])` - Error log
- `static fatal(tag: string, message: string | object)` - Fatal error log

**Properties:**
- `static LOG_LEVEL` - Set log level

### PermissionUtil

Permission management utility class.

**Methods:**
- `checkPermissions(permissions: Permissions[])` - Check if permissions are granted
- `requestPermissions(permissions: Permissions[])` - Request permissions

**Instance:**
- `permissionUtil` - Exported singleton object

### PreferenceStorage

Key-value storage based on Preferences.

**Methods:**
- `getValue(key: string): Promise<string | null>` - Get value
- `putValue(key: string, value: string): Promise<void>` - Store value
- `setStyle(key: string, value: string[]): Promise<void>` - Store array
- `getStyle(key: string): Promise<string[] | null>` - Get array
- `flushAllData(): Promise<void>` - Flush to disk

### MediaHelper

Media operation helper class.

**Methods:**
- `selectImage(): Promise<string>` - Select image
- `selectDocument(): Promise<string>` - Select document
- `convertImageToBase64(): Promise<string>` - Convert image to Base64
- `takePhoto(): Promise<void>` - Take photo

### StringUtil

String utility class.

**Methods:**
- `static isEmpty(str: string): boolean` - Check if string is empty
- `static isNotEmpty(str: string): boolean` - Check if string is not empty
- `static isNullOrEmpty(str: string | null): boolean` - Check if null or empty
- `static isNotNullOrEmpty(str: string | null): boolean` - Check if not null and not empty
- `static arrayBuffer2String(buffer: ArrayBuffer): string` - Convert ArrayBuffer to string

### KvStoreUtil

Distributed key-value database utility for cross-device data synchronization.

**Methods:**
- `createKvStore(context, callback)` - Create distributed KV store
- `put(key, value, deviceId?)` - Store data with optional device sync
- `setDataChangeListener(callback)` - Listen for data changes
- `removeDataChangeListener()` - Remove data change listener

**Features:**
- Automatic device synchronization
- Data change notifications
- Secure storage (S1 level)
- Auto-sync enabled by default

### DeviceManager

Device discovery and distributed capability management.

**Methods:**
- `createDeviceManager()` - Initialize device manager
- `startDeviceDiscovery()` - Start discovering nearby devices
- `stopDeviceDiscovery()` - Stop device discovery
- `authenticateDevice(context, device, sharedList)` - Authenticate and bind device
- `unbindDevice(deviceId)` - Unbind device
- `startAbility(context, device, sharedList)` - Start remote ability
- `getBoundDeviceList()` - Get list of bound devices

**Features:**
- Automatic device state monitoring
- Device online/offline detection
- Cross-device ability launching
- Secure device pairing
- Device list management via AppStorage

## 📝 Development Guide

### Adding New Utility Classes

1. Create utility class file in the corresponding directory (use `.ets` extension)
2. Export the class or function using `export`
3. Add export statement in `Index.ets`
4. Update README.md documentation

Example:

```typescript
// src/main/ets/utils/DateUtil.ets
export class DateUtil {
  static formatDate(date: Date): string {
    // Implementation
  }
}
```

```typescript
// Index.ets
export { DateUtil } from './src/main/ets/utils/DateUtil'
```

## 🤝 Contributing

Issues and Pull Requests are welcome!

## 📄 License

This project is licensed under the [Apache-2.0](LICENSE) License.

---

**Note**: This utility library is intended for HarmonyOS application development only. Please ensure you are using HarmonyOS API 18 or higher.
