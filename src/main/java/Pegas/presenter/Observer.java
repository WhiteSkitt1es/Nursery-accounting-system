package Pegas.presenter;

import Pegas.model.Animals;

import java.util.Map;

public interface Observer {
    int addAnimalToRegistry(String name, int age, String commands, String type);
    void addNewCommandToAnimal(int number, String str);
    Map<Integer, Animals> loadList();

}
