import Custom "custom";
import Animal "animal";
import CustomList "list";
import List "mo:base/List";
import Array "mo:base/Array";

actor{
    type Tech = Custom.Tech;
    type Animal = Animal.Animal;

    let dog = {
        specie="dog";
        energy=30;
    };
    public func getMyTech():async Tech{
        let js:Tech = {
            name="Javascript";
            fondness=9;
        };
        return js;
    };

    // Challenge 4
    public func create_animal_then_takes_a_break(specie:Text,energy:Nat):async Animal{

        var animal:Animal = {
            specie=specie;
            energy=energy;
        };

        animal := Animal.animal_sleep(animal);
        return animal;
    };

    // Challenge 5
    public type List<T> = ?(T, List<T>);
    var animals:List<Animal> = List.nil<Animal>();
    

    // Challenge 6
    public func push_animal(animal:Animal):async (){
        animals := List.push<Animal>(animal, animals);   
    };
    public func get_animals():async [Animal]{
        return List.toArray(animals);
    };
}