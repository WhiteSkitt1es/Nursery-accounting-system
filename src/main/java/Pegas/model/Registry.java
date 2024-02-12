package Pegas.model;

import Pegas.presenter.Model;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Registry implements Model {
    private final Map<Integer, Animals> registry = new HashMap<>();

    public Map<Integer, Animals> loadRegistry(){
        return registry;
    }

    public int addAnimal(String name, int age, String commands, String type){
        Animals animal = switch (TypeOfAnimal.valueOf(type)) {
            case CAT -> new Cat(name, age, commands);
            case DOG -> new Dog(name, age, commands);
            case HUMSTER -> new Humster(name, age, commands);
            case HORSE -> new Horse (name, age, commands);
            case CAMEL -> new Camel (name, age, commands);
            case DONKEY -> new Donkey (name, age, commands);
        };
        registry.put(animal.getId(), animal);
        return animal.getId();
    }
    public Optional<Animals> findAnimal(int id){
        return Optional.ofNullable(registry.get(id));
    }
    public void addNewCommands(int number, String str){
        if(findAnimal(number).isPresent()){
            Animals animal = findAnimal(number).get();
            animal.getCommands().addAll(Arrays.asList(str.trim().split(",")));
        } else {
            System.out.println("Animal wasn't found");
        }
    }
}
