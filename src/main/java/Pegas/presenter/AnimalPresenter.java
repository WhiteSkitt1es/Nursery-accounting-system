package Pegas.presenter;

import Pegas.model.Animals;

import java.util.Map;

public class AnimalPresenter implements Observer {
    private final Model model;
    private final View view;

    public AnimalPresenter(Model model, View view) {
        this.model = model;
        this.view = view;
        view.setObserver(this);
    }
    public Map<Integer, Animals> loadList(){
       return model.loadRegistry();
    }

    @Override
    public int addAnimalToRegistry(String name, int age, String commands, String type) {
        return model.addAnimal(name, age, commands, type);
    }
    @Override
    public void addNewCommandToAnimal(int number, String str) {
        model.addNewCommands(number,str);
    }
}
