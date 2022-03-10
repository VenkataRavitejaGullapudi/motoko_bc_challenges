module{
    public type List<T> = ?(T,List<T>);
    // Challenge 7
    public func is_null<T>(l:List<T>): Bool{
        switch(l){
            case(null) {
                return true;
            };
            case(?list){
                return false;
            };
        }
    };
    
    // Challenge 8
    public func last<T>(l:List<T>): ?T{
        switch(l){
            case(null){
                return null;
            };
            case(?(lastEle,null)){
                return ?lastEle;
            };
            case(?(_,next)){
                return last<T>(next);
            };
        };
    };

    // Challenge 9
    public func size<T>(l:List<T>): Nat{
        // var n:Nat=0;
        func iterate(l : List<T>, n : Nat) : Nat {
            switch(l){
                case(null){
                    return n;
                };
                case(?(_,next)){
                    return iterate(next,n+1);
                };
            };
        };
        return iterate(l,0);
    };

    // Challenge 10
    public func get<T>(l:List<T>,n:Nat): ?T{
        func iterate(l : List<T>, n : Nat,i:Nat) : ?T {
            switch(l){
                case(null){
                    return null;
                };
                case(?(data,next)){
                    if(i == n){
                        return ?data;
                    };
                    return iterate(next,n,i+1);
                };
            };
        };
        return iterate(l,n,0);
    };


};