import UIKit

var str = "Hello, playground"
func sliceArray<T>(_ arr: Array<T>, _ x1: Int, _ x2: Int) -> Array<T> {
    
    var tt: Array<T> = []
    
    for index in stride(from: x1, to: (x2+1), by: 1) {
        tt.append(arr[index])
    }
    
    
    return tt
    
}

func combinations<T>(_ arr: Array<T>,_ k: Int) -> Array<Array<T>> {
    
    
    var ret: Array<Array<T>> = []
    
    var sub: Array<Array<T>> = []
    
    var next: Array<T> = []
    
    for i in stride(from: 0, to: arr.count, by: 1) {
        if(k == 1){
            
            ret.append([arr[i]])
            
        }else {
            let sliceElement =  sliceArray(arr, i + 1, arr.count - 1)
            
            sub =   combinations(sliceElement, k - 1)
            
            for index in stride(from: 0, to: sub.count, by: 1) {
                next = sub[index]
                
                next.insert(arr[i], at: 0)
                
                ret.append(next)
            }
            
            
        }
    }
    
    
    return ret
    
}

print(combinations([1,2,3], 2))
