var integerArray = [Int]()
for i in 5...125{
    integerArray.append(i)
}
integerArray.removeFirst(5)
integerArray.replaceSubrange(integerArray.count-5...integerArray.count-1,with: repeatElement(0,count:2))
for (index,value) in integerArray.enumerated() {
    print("Index: \(index) Values: \(value)")
}

//4.2
var chess = [String: (alpha:Character,num:Int)?]()
chess["Белый конь"] = ("E",3)
chess["Пешка"] = ("C",4)
chess["Ладья"] = ("B",3)
chess["Ладья"] = nil

func checkFigure(_ figure: String){
    if let position = chess[figure]{
        print("Позиция: \(position!.alpha)\(position!.num)")
    }else{
        print("\(figure) отстутствует на поле")
    }
}
checkFigure("Белый конь")
checkFigure("Ладья")