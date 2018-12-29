
# React Native iCloud Account Status

React Native module to determine whether the current user’s iCloud account can be accessed.

## Table of Contents

* [Getting started](#getting-started)
  * [Requirements](#requirements)
  * [Mostly automatic installation](#mostly-automatic-installation)
  * [Manual installation](#manual-installation)
* [Usage](#usage)
* [API](#api)
  * [Constants](#constants)
  * [Methods](#methods)
* [License](#license)

## Getting started

### Requirements

* iOS 8.0+
* The iCloud capability with CloudKit:
  1. Click on your target and then the Capabilities tab
  2. Turn on the iCloud capability
  3. Expand it and check the CloudKit option under Services

### Mostly automatic installation

1. `$ npm install react-native-icloud-account-status --save`
2. `$ react-native link react-native-icloud-account-status`

### Manual installation

1. `$ npm install react-native-icloud-account-status --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-icloud-account-status` and add `RNIcloudAccountStatus.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRNIcloudAccountStatus.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Run your project (`Cmd+R`)

## Usage

```javascript
import iCloudAccountStatus from 'react-native-icloud-account-status';

iCloudAccountStatus.getStatus()
  .then((accountStatus) => {
    if (accountStatus === iCloudAccountStatus.STATUS_AVAILABLE) {
      alert('iCloud is available');
    } else {
      alert('iCloud is not available');
    }
  })
  .catch((error) => {
    alert(`Error when getting iCloud account status: ${error.message}`);
  });
```

## API

### Constants

* `STATUS_COULD_NOT_DETERMINE`
* `STATUS_AVAILABLE`
* `STATUS_RESTRICTED`
* `STATUS_NO_ACCOUNT`

### Methods

#### getStatus()

Gets the current user's iCloud account status.

Returns a `Promise` that resolves to a string of one of the following:

* `'couldNotDetermine'`
* `'available'`
* `'restricted'`
* `'noAccount'`

For more information about each status, see [`CKAccountStatus`](https://developer.apple.com/documentation/cloudkit/ckaccountstatus?language=objc) at the Apple Developer Documentation.

## License

Copyright (c) 2018 Blockfirm AB

This project is licensed under the MIT License.
See [LICENSE](LICENSE) for full license text.
