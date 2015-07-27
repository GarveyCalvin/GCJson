# GCJson

##Introcdution

Create by `GarveyCalvin` in`GCJson` project.

GCJson is a JSON and array or dictionary conversion tools.

You can use It convert json to dictionary or json to array. Or dictionary to json or array to json.

It's a good small tool. Only have a swift file.

##Usage

Usage:

```
let dic = ["modify": "true", "isOn": "false"]
let array = ["modify", "true", "isOn", "false"]
let jsonStr = GCJson.toJson(array)
println(jsonStr)

let dicOrArray = GCJson.toArray(jsonStr as! String)
println(dicOrArray)
```

Public method list:

```
GCJson.toJson()
GCJson.toArray()
GCJson.toDic()
```