import Array "mo:base/Array";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Prim "mo:prim";
import Text "mo:base/Text";
import Trie "mo:base/Trie";
import TrieMap "mo:base/TrieMap";
import TrieSet "mo:base/TrieSet";
actor{
    private func char_at_pos(t:Text,n:Nat): Char{
        var c=0;
        for(char in t.chars()){
            if(c == n){
                return char;
            };
            c += 1;
        };
        return '?';
    };

    // Challenge 1
    public func nat_to_nat8(n:Nat):async Nat8{
        return Nat8.fromNat(n % (255+1));
    };

    // Challenge 2
    public func max_number_with_n_bits(n:Nat):async Nat{
        var max_number:Nat = 0;
        for(i in Iter.range(0,n-1)){
            max_number += (2**i);
        };  
        return max_number;
    };

    // Challenge 3
    public func decimal_to_bits(n:Nat):async Text{
        var binary:Text = "";
        var num:Nat=n;
        while(num > 0){
            binary := Text.concat(Nat.toText((num % 2)),binary);
            num /= 2;
        };
        return binary;
    };

    // Challenge 4
    public func capitalize_character(c:Char):async Char{
        if(Char.isUppercase(c)){
            return c;
        }
        else{
            return Char.fromNat32(65+(Char.toNat32(c)-97));
        }
    };

    // Challenge 5
    public func capitalize_text(t:Text):async Text{
        return Text.map(t , Prim.charToUpper);
    };

    // Challenge 6
    public func is_inside(t:Text,c:Char):async Bool{
        for(i in t.chars()){
            if(i == c){
                return true;
            }
        };
        return false;
    };

    // Challenge 7
    public func trim_whitespace(t:Text):async Text{
        return Text.trim(t, #text " ");
    };
  
    // Challenge 8
    public func duplicated_character(t:Text):async Text{
        for( i in Iter.range(0,t.size()-1)){
            var count=0;
            for(j in Iter.range(i+1,t.size()-1)){
                if(char_at_pos(t,j)==char_at_pos(t,i)){
                    return Text.fromChar(char_at_pos(t,j))
                }
            }
        };
        return t;
    };


    // Challenge 9
    public func size_in_bytes(t:Text):async Nat{
        return Text.encodeUtf8(t).size();
    };

    // Challenge 10
    public func bubble_sort(array:[Nat]):async [Nat]{
        var arr:[var Nat] = Array.thaw(array);
        let n:Nat = arr.size();
        for(i in Iter.range(0,n-1)){
            for(j in Iter.range(0,n-i-2)){
                if(arr[j] > arr[j+1]){
                    let temp = arr[j];
                    arr[j]:=arr[j+1];
                    arr[j+1]:=temp;
                }
            }
        };
         return Array.freeze<Nat>(arr);
    };

    //	Return the character corresponding to the unicode value n.
    public func unicode_to_character(n : Nat32) : async Text {
    	let char : Char = Char.fromNat32(n);
    	return(Char.toText(char));
    };
    
}