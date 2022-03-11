import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import TokenIndex "mo:base/Array";
import Nat "mo:base/Nat";
import Result "mo:base/Result";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import List "mo:base/List";
import Iter "mo:base/Iter";
import HTTP "http"
actor NFTStandard {
    // Challenge 1
    type TokenIndex = Nat;
    type Error = {
        #InvalidPrincipal;
        #InvalidInput;
    };

    stable var registryEntries : [(TokenIndex,Principal)] = []; //Challenge 7

    // Challenge 2
    var registry:HashMap.HashMap<TokenIndex,Principal> = HashMap.fromIter<TokenIndex,Principal>(registryEntries.vals(),registryEntries.size(),Nat.equal,Hash.hash);

    // Challenge 3
    stable var nextTokenIndex:Nat = 0;
    public shared({caller}) func mint():async Result.Result<(),Text>{
        if(Principal.isAnonymous(caller)){
            return #err("You need to be authenticated to mint");
        } else {
            registry.put(nextTokenIndex,caller);
            nextTokenIndex+=1;
            return #ok; 
        }
    };

    // Challenge 4
    public shared({caller}) func transfer(to:Principal,tokenIndex:Nat):async Result.Result<Text,Text>{
        if(Principal.isAnonymous(caller)){
            return #err("You need to be authenticated to transfer");
        }
        else if(Principal.isAnonymous(to)){
            return #err("Reciever must be a valid principal, anonymous principal received");
        }
        else if(caller == to){
            return #err("Token is already yours");
        }
        else{
            registry.put(tokenIndex,to);
            nextTokenIndex+=1;
            return #ok("Token is transferred to " # Principal.toText(to));
        }
    };

    // Challenge 5
    public shared({caller}) func balance():async List.List<TokenIndex>{
        var callertokens:List.List<TokenIndex> = List.nil<TokenIndex>();
        if(Principal.isAnonymous(caller)){
            return List.nil<TokenIndex>();
        };
        for ((k,v) in registry.entries()) {
            if(v == caller){
                callertokens := List.push<TokenIndex>(k,callertokens);
            }
        };
        return callertokens;
    };

    // Challenge 6
    public query func http_request(request : HTTP.Request):async HTTP.Response{
        let latest_minter:?Principal = registry.get(nextTokenIndex-1);
        switch(latest_minter){
            case(null){
                 let response:HTTP.Response = {
                    body = Text.encodeUtf8("Something went wrong!!");
                    headers = [("Content-Type", "text/html; charset=UTF-8")];
                    status_code = 500 : Nat16;
                    streaming_strategy = null
                };
                return response;
            };
            case(?latest_minter){              
                let total_nfts_mined:Nat=nextTokenIndex;
                let response:HTTP.Response = {
                    body = Text.encodeUtf8("No of NFTs minted are " # Nat.toText(total_nfts_mined) #". And Principal of Latest Minter is"# Principal.toText(latest_minter));
                    headers = [("Content-Type", "text/html; charset=UTF-8")];
                    status_code = 200 : Nat16;
                    streaming_strategy = null
                };
                return response;
            }
        };
    };

    // Challenge 7
    stable var version_number=1;
    system func preupgrade() {
        // Do something before upgrade
        registryEntries := Iter.toArray(registry.entries()); 
    };

    system func postupgrade() {
        // Do something after upgrade
        version_number+=1; 
        registryEntries:=[];
    };

}