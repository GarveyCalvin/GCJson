# GCJson

##Introcdution

Create by `GarveyCalvin` in`GCJson` project.

GCJson can be Use in iOS.

GCJson is a JSON and array or dictionary conversion tools.

You can use It convert json to dictionary or json to array. Or dictionary to json or array to json.

It's a good small tool. Only have a swift file. It is created in swift v1.2.

**Update record**

***2015/11/25: Support to swift 2.0***

##Usage

Usage:

```swift
let dic = ["modify": "true", "isOn": "false"]
let array = ["modify", "true", "isOn", "false"]
let jsonStr = GCJson.toJson(array)
println(jsonStr)

let dicOrArray = GCJson.toArray(jsonStr as! String)
println(dicOrArray)
```

Public method list:

```swift
GCJson.toJson()
GCJson.toArray()
GCJson.toDic()
```

**Update in 2015.9.9**

You can use `toDicFromFile(_:)` and `toArrayFromFile(_:)` to convert your jsonSring to NSArray or NSDictionary from local file.

For example:

`JsonArrayFile.geojson` file

```swift
[
 {
    "name": "Garvey",
    "age": "21"
 }
]
```

Test code

```swift
if let filePath = NSBundle.mainBundle().pathForResource("JsonArrayFile", ofType: "geojson") {
    if let array = GCJson.toArrayFromFile(filePath) {
        println(array)
    }
}
```
