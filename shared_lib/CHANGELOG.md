# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2025-12-10

### ✨ New Features
- **KvStoreUtil** - Distributed key-value database utility
  - Cross-device data synchronization
  - Real-time data change notifications
  - Secure storage with S1 security level
  - Auto-sync capabilities
- **DeviceManager** - Device discovery and management utility
  - Device discovery and pairing
  - Device state monitoring (online/offline)
  - Cross-device ability launching
  - Secure device authentication
  - Device list management

### 📚 Documentation
- Added KvStoreUtil usage examples and API documentation
- Added DeviceManager usage examples and API documentation
- Updated project structure in README
- Updated feature list

---

## [1.0.0] - 2025-12-10

### 🎉 Initial Release

#### ✨ New Features
- **Directory Structure Optimization**
  - `class` → `models` - Data models directory
  - `helper` → `helpers` - Business helper classes directory
  - `preference` → `storage` - Storage utilities directory
  - Removed unnecessary `pages` directory

- **Utility Class Renaming**
  - `Log` → `Logger` - Avoid confusion with system logging
  - `Storage` → `PreferenceStorage` - More explicit naming
  - `PermissionHandler` → `PermissionUtil` - Unified utility class naming convention

- **File Extension Standardization**
  - All TypeScript files now use `.ets` extension

- **Enhanced Export Mechanism**
  - Created unified `Index.ets` export entry point
  - Categorized exports: models, helpers, storage, utilities

- **Core Utility Classes**
  - `Logger` - Logging utility with multi-level log output support
  - `FileUtil` - File operation utility
  - `ImageUtil` - Image processing utility
  - `PermissionUtil` - Permission management utility
  - `StringUtil` - String utility
  - `PreferenceStorage` - Data storage utility
  - `MediaHelper` - Media operation helper class

#### 📚 Documentation
- Added comprehensive README.md documentation
- Includes usage examples and API documentation
- Added development guide

#### 🔧 Configuration
- Updated `oh-package.json5` configuration
- Enhanced package description and author information

---

## Version Format

- `[MAJOR.MINOR.PATCH]` - Release Date
- **MAJOR**: Incompatible API changes
- **MINOR**: Backwards-compatible new features
- **PATCH**: Backwards-compatible bug fixes

### Change Type Labels
- 🎉 **Initial Release** - Initial project version
- ✨ **Added** - New features
- 🐛 **Fixed** - Bug fixes
- 🔧 **Changed** - Functionality changes
- ⚠️ **Deprecated** - Features to be removed soon
- 🗑️ **Removed** - Removed features
- 🔒 **Security** - Security-related fixes
- 📚 **Documentation** - Documentation updates
