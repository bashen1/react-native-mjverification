# React-Native-mJVerification

[![npm version](https://badge.fury.io/js/react-native-mjverification.svg)](https://badge.fury.io/js/react-native-mjverification)

SDK Version

Android：3.2.1

iOS：3.2.1

此项目基于jverification-react-native@2.5.5修改调整

## 1. 安装

```sh
npm install react-native-mjverification --save
```

* 注意：如果项目里没有react-native-mjcore，需要安装

```sh
npm install react-native-mjcore --save
```

## 2. 配置

### 2.1 Android

* build.gradle

  ```sh
  android {
        defaultConfig {
            applicationId "yourApplicationId"           //在此替换你的应用包名
            ...
            manifestPlaceholders = [
                    JPUSH_APPKEY: "yourAppKey",         //在此替换你的APPKey
                    JPUSH_CHANNEL: "yourChannel"        //在此替换你的channel
            ]
        }
    }
  ```

  ```sh
  dependencies {
        ...
        implementation project(':react-native-mjverification') // 添加 jverification 依赖
        implementation project(':react-native-mjcore')         // 添加 jcore 依赖
    }
  ```

* setting.gradle

  ```sh
  include ':react-native-mjverification'
  project(':react-native-mjverification').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-mjverification/android')
  include ':react-native-mjcore'
  project(':react-native-mjcore').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-mjcore/android')
  ```

### 2.2 iOS

打开`ios/Podfile`文件，添加以下自建百川仓库，可以自己fork

```Podfile
require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'
·······
target 'App' do
  # tag为https://github.com/bashen1/JVerification-Specs.git仓库实际tag
  pod 'JVerification-Specs', :git=> 'https://github.com/bashen1/JVerification-Specs.git', :tag=> '1.1.0'

  pod 'FBLazyVector', :path => "../node_modules/react-native/Libraries/FBLazyVector"
·······
target
```

### 2.2.1 pod

```sh
pod install
```

* 注意：如果项目里使用pod安装过，请先执行命令

  ```sh
  pod deintegrate
  ```

### 2.2.2 配置AppKey

* App.js

```js
const initParams = {
    'time': 5000,
    'appKey': 'yourAppKey',               //仅iOS
    'channel': 'channel',                 //仅iOS
    'advertisingId': 'advertisingId',     //仅iOS
    'isProduction': false,                //仅iOS
};
```

## 3. 引用

参考：[App.js](https://github.com/bashen1/react-native-mjverification/tree/master/example/App.js)

## 4. API

+ API详细说明：[API详细说明.md](https://github.com/bashen1/react-native-mjverification/blob/master/API%E8%AF%A6%E7%BB%86%E8%AF%B4%E6%98%8E.md) 

+ 授权页面元素配置说明：[认证SDK授权页面元素配置API说明.md](https://github.com/bashen1/react-native-mjverification/blob/master/%E8%AE%A4%E8%AF%81SDK%E6%8E%88%E6%9D%83%E9%A1%B5%E9%9D%A2%E5%85%83%E7%B4%A0%E9%85%8D%E7%BD%AEAPI%E8%AF%B4%E6%98%8E.md)

+ 示例详见：[index.js](https://github.com/bashen1/react-native-mjverification/tree/master/index.js)

## 5.  其他

* 集成前务必将example工程跑通
* JVerification2.2.0属于重构版本，如有紧急需求请前往[极光社区](https://community.jiguang.cn/c/question)
* 上报问题还麻烦先调用JVerification.setLoggerEnable( true)，拿到debug日志
* 模块升级时请注意上方iOS的集成方式，如果SDK升级了，需要改tag
`pod 'JVerification-Specs', :git=> 'https://github.com/bashen1/JVerification-Specs.git', :tag=> '1.0.0'`
