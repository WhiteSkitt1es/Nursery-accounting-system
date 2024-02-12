package Pegas.presenter;

import Pegas.model.Animals;

import java.util.Map;

public interface View {
    void showAnimals();
    void setObserver(Observer observer);
    void addAnimal(String name, int age, String commands, String type);
    void addNewCommand(int number, String str);
}
