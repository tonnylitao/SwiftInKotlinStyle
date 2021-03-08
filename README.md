# SwiftInKotlinStyle

[http://github.com/tonnylitao/SwiftInKotlinStyle](http://github.com/tonnylitao/SwiftInKotlinStyle)

This Swift package can help you to write swift in kotlin style.

### Scope Functions

* apply

    ```swift
    view = UIView().apply {
        $0.frame = CGRect(x: 10, y: 10, widht: 100, height: 100)
        $0.backgroundColor = .red
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 5
    }
    ```

* let

    ```swift
    url.let {
        let file = open($0)
        let data = read(file)
        ...
        
        return "I already read it"
        
        //or return any other type
        //e.g. return .success("I read it")
    }
    ```
