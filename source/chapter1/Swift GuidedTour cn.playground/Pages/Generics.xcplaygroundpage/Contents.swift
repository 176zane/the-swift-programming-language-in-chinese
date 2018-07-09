//: ## 泛型（Generics）
//:
//: 在尖括号里写一个名字来创建一个泛型函数或者类型。
//:
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes:4)

//: 你也可以创建泛型函数、方法、类、枚举和结构体。
//:
// 重新实现Swift标准库的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//: 在类型名后面使用`where`来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。
//:
func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])

//: > **练习**:
//: > 修改`anyCommonElements(_:_:)`函数来创建一个函数，返回一个数组，内容是两个序列的共有元素。
//:
//: `<T: Equatable>`和`<T where T: Equatable>`是完全等价的。
//:


//: [上一页](@previous)
