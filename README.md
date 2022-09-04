# CodableDefaultValue

解决 Codable 不支持默认值的问题。

* 使用简单，清晰可读
* 支持所有主要类型
* 详尽的单元测试

## 类型支持

* Bool
* Int
* UInt
* String
* Date
* 枚举
* 对象
* 数组

## 引入

### CocoaPods

```
pod 'CodableDefaultValue'
```

## 用法

### 基本类型

```swift
struct User {
    @DefaultBool var isLogin: Bool

    @DefaultInt var age: Int

    @DefaultUInt var id: UInt

    @DefaultString var name: String

    @DefaultDate var birthday: Date
}
```

### 枚举

枚举类型仅支持 RawValue 为 Int 型，并需要实现 HasDefaultEnumValue 协议。

```swift
enum Gender: Int, HasDefaultEnumValue {
    case man = 1
    case woman = 2
    static var defaultValue = Gender.man
}

struct User {
    // 这里需要指定类型参数
    @DefaultIntEnum<Gender> var gender: Gender
}
```

### 对象

对象类型的默认值使用空值对象，因此需要实现 EmptyInitializable 协议。

```swift
struct ObjectInfo: Codable, EmptyInitializable {
    @DefaultString var name: String
    @DefaultInt var age: Int
}

struct User {
    @DefaultObject var info: ObjectInfo
}
```

### 数组

#### 基础类型数组

```swift
@DefaultArray var nums: [Int]
```

#### 对象数组

```swift
struct Info: Codable {
    var name: String
}

@DefaultArray var infos: [Info]
```

