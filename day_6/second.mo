import Result "mo:base/Result";

actor{
    let NFTStandard : actor {
        mint : () -> async  Result.Result<(),Text>;
    } = actor("rdmx6-jaaaa-aaaaa-aaadq-cai");

    public func mint_nft() : async Result.Result<(),Text> {
        return(await NFTStandard.mint())
    };
}