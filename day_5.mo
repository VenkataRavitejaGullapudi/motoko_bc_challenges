import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";


actor {
    // Challenge 1
    public shared({caller}) func is_anonymous(): async Bool{
        // "2vxsx-fae"
        // let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
        return Principal.isAnonymous(caller);
    };

    // Challenge 2
    stable var entries : [(Principal, Nat)] = []; //Challenge 9
    // let favoriteNumber:HashMap.HashMap<Principal,Nat> = HashMap.HashMap<Principal,Nat>(0,Principal.equal,Principal.hash);
    let favoriteNumber:HashMap.HashMap<Principal,Nat>  = HashMap.fromIter<Principal,Nat>(entries.vals(),entries.size(),Principal.equal,Principal.hash);


    // Challenge 3 & 4
    public shared(msg) func add_favorite_number(n:Nat):async Text{
        let prinicipal = msg.caller;
        if(not Option.isNull(favoriteNumber.get(prinicipal))){
            return "You've already registered your number";
        };
        favoriteNumber.put(prinicipal,n);
        return "You've successfully registered your number";
    };
    public shared(msg) func show_favorite_number():async ?Nat{
        return favoriteNumber.get(msg.caller);
    };
    

    // Challenge 5
    public shared({caller}) func update_favorite_number(n:Nat):async (){
        favoriteNumber.put(caller,n);
    };

     public shared({caller}) func delete_favorite_number():async ?Nat{
         return favoriteNumber.remove(caller);
    };

    // Challenge 6 Pending
    // public func deposit_cycles():async Nat{
       
    // };

    // Challenge 7 pending



    // Challenge 8
    stable var counter:Nat = 0;
    stable var version_number:Nat = 1;
    public func increment_counter(n:Nat):async Nat{
        counter:= (counter+n);
        return counter;
    };

    public func clear_counter():async Nat{
        counter:=0;
        return counter;
    };

    public func get_version_number():async Nat{
        return version_number;
    };

    // Challenge 10 Pending

    

    

    system func preupgrade() {
        // Do something before upgrade
        entries := Iter.toArray(favoriteNumber.entries()); // Challenge 9
    };

    system func postupgrade() {
        // Do something after upgrade
        version_number+=1; // Challenge 8

        entries:=[]; // Challenge 9
    };


}