import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
actor {
    var counter:Nat = 0;
    public func greet(name : Text) : async Text {
        return "Hello, " # name # "!";
    };

    public func add(n:Nat, m:Nat):async Nat{
        // Challenge 1
        return n+m;
    };

    public func square(n:Nat):async Nat{
        // Challenge 2
        return n*n;
    };

    public func days_to_second(n:Nat):async Nat{
        // Challenge 3
        return n*24*60*60;
    };

    public func increment_counter(n:Nat):async Nat{
        // Challenge 4
        counter:= (counter+n);
        return counter;
    };

    public func clear_counter():async Nat{
        // Challenge 4
        counter:=0;
        return counter;
    };

    public func divide(n:Nat,m:Nat):async Bool{
        // Challenge 5
        if(m%n==0){
            return true;
        }
        else{
            return false;
        }
    };

    public func is_even(n:Nat):async Bool{
        // Challenge 6
        if(n%2==0){
            return true;
        }
        else{
            return false;
        };
    };

    public func sum_of_array(array:[Nat]):async Nat{
        // Challenge 7
        var sum:Nat=0;
        for(val in array.vals()){
            sum:=(sum+val);
        };
        return sum;
    };

    public func maximum(array:[Nat]):async Nat{
        // Challenge 8
        var max:Nat=0;
        for(val in array.vals()){
            if(max < val){
                max:=val;
            }
        };
        return max;
    };

    
    public func remove_from_array(array:[Nat],n:Nat):async [Nat]{
        // Challenge 9
        return Array.filter<Nat>(array,func(val:Nat):Bool{
            if(val==n){
                return false;
            };
            return true;
        })
    };

    public func selection_sort(array:[Nat]):async [Nat]{
        // Challenge 10
        for (i in Iter.range(0,array.size()-1)) {
            var min:Nat=i;
            for(j in Iter.range(i+1,array.size()-1)){
                if(array[j] < array[min]){
                    min:=j;
                }
            };
            if(min!=i){
                let temp = array[min];
                array[min]:=array[i];
                array[i]:=temp;
            }
        };
        return array;
    };

};
