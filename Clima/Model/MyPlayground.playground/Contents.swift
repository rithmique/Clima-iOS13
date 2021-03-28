import UIKit

func calculator(n: Int, m: Int, operation: (Int, Int)-> Int) -> Int{
    return operation(n, m)
}
func add(n1: Int, m1: Int) -> Int { return n1 + m1 }
calculator(n: 2, m: 5, operation: add)
//is equal to
calculator(n: 2, m: 5, operation: { (n1: Int, m1: Int) -> Int in return n1 + m1 })
//and also to
calculator(n: 2, m: 5) {$0 + $1}

let array = [0,1,2,3,45,56]

func addOne(n: Int) -> Int{
    return n + 1
}
// array.map(addOne) or
array.map(){$0+1}
