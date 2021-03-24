# SwiftInKotlinStyle

[http://github.com/tonnylitao/SwiftInKotlinStyle](http://github.com/tonnylitao/SwiftInKotlinStyle)

This Swift package can help you to write some swift code in kotlin style.

### Scope Functions

* also

    ```swift
    view = UIView().also {
        $0.frame = CGRect(x: 10, y: 10, widht: 100, height: 100)
        $0.backgroundColor = .red
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 5
    }
    ```

* let

    ```swift
    var url: Url? = nil
    ..
    url.let {
        let file = openFile($0)
        let data = read(file)
        ...
        
        return "I already read it"
        
        //or return any other type
        //e.g. return .success("I read it")
    }
    ```
    
* takeIf

    ```swift
    let number = 1
    let even = number.takeIf { $0 % 2 == 0 }
    ```


