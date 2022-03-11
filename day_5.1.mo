actor{
        // Challenge 2
    let favoriteNumber:HashMap.HashMap<Principal,Nat> = HashMap.HashMap<Principal,Nat>(0,Principal.equal,Principal.hash);


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
}