package Pegas.view;

import Pegas.model.Animals;
import Pegas.presenter.Observer;
import Pegas.presenter.View;

public class AnimalView implements View {

    private Observer observer;
    public void setObserver(Observer observer) {
        this.observer = observer;
    }
    private int num;
    public void showAnimals() {
        if(observer != null) {
            if(observer.loadList().isEmpty()){
                System.out.println("Список пуст");
            }else {
                observer.loadList().entrySet().forEach(System.out::println);
            }
        }
    }
    public void addAnimal(String name, int age, String commands, String type) {
        if(observer != null) {
            num = observer.addAnimalToRegistry(name, age, commands, type);
            System.out.println("Успешно добавлено");
        }
    }
    public void addNewCommand(int number, String str){
        if(observer != null) {
            observer.addNewCommandToAnimal(number,str);
            System.out.println("Успешно добавлено");
        }
    }
    public void showRegistrationResult() {
        if(num != 0) {
            System.out.println("Your animal registration number is: " + num);
        }else{
            System.out.println("Животных еще нет");
        }
    }
}