import Array "mo:base/Array";
import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Option "mo:base/Option";
import Text "mo:base/Text";
actor{

    // Challenge 1
    private func swap(arr:[var Nat], j:Nat, i:Nat):[var Nat]{
        let temp:Nat = arr[j];
        arr[j] := arr[i];
        arr[i] := temp;
        return arr;
    };

    // Challenge 2
    public func init_count(n: Nat): async [Nat]{
        let arr : [var Nat] = Array.init<Nat>(n, 0);
        for(i in Iter.range(0,n-1)){
            arr[i]:=i;
        };
        return Array.freeze<Nat>(arr);
    };

    // Challenge 3
    public func seven(array:[Nat]):async Text{
        for(i in array.vals()){
            if(i == 7){
               return "Seven is found"; 
            }
        };
        return "Seven not found";
    };

    // Challenge 4
    public func nat_opt_to_nat(n:?Nat, m:Nat):async Nat{
        // if(Option.isNull(n)){
        //     return m;
        // }
        // else{
        //     return n;
        // }

        switch(n){
            case(null) {
                return m;
            };
            case(?something){
                return something;
            };
        };
    };

    // Challenge 5
    public func day_of_the_week(n:Nat):async ?Text{
        let days:HashMap.HashMap<Text,Text> = HashMap.HashMap<Text,Text>(0,Text.equal,Text.hash);
        days.put("1","Monday");
        days.put("2","Tuesday");
        days.put("3","Wednesday");
        days.put("4","Thursday");
        days.put("5","Friday");
        days.put("6","Saturday");
        days.put("7","Sunday");
        return days.get(Nat.toText(n));
    };   

    // Challenge 6
    public func populate_array(array:[?Nat]):async [Nat]{
        return Array.map<?Nat,Nat>(array,func(val:?Nat):Nat{
            switch(val){
                case(null){
                    return 0;
                };
                case(?some){
                    return some;
                }
            }
        });
    };

    // Challenge 7
    public func sum_of_array(array:[Nat]):async Nat{
        return Array.foldLeft<Nat,Nat>(array,0,Nat.add);
    };

    // Challenge 8
    public func squared_array(array:[Nat]):async [Nat]{
        return Array.map<Nat,Nat>(array,func(val:Nat):Nat{
            return val*val;
        });
    };

    // Challenge 9
    public func increase_by_index(array:[Nat]):async [Nat]{
        return Array.mapEntries<Nat,Nat>(array,func(val:Nat,index:Nat):Nat{
            return val+index;
        });
    };

    // Challenge 10
    private func contains<T>(array:[T],a:T,f:(T,T)->Bool):async Bool{
        for(val in array.vals()){
            if(f(val,a)){
                return true;
            }
        };
        return false;
    };
}