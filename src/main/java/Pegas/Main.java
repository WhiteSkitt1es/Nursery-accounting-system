package Pegas;

import Pegas.model.Registry;
import Pegas.presenter.AnimalPresenter;
import Pegas.view.AnimalView;

import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {
        AnimalView animalView = new AnimalView ();
        Registry registry = new Registry();
        AnimalPresenter shopPresenter = new AnimalPresenter(registry, animalView);
        boolean flag = true;
        System.out.println("Привет! Что бы зарегистрировать животное, пороследуй по меню: ");
        while (flag){
            System.out.println("Выберите один из следующих пунктов: 1.Показать весь список животных; 2.Добавить животное;" +
                    "3.Показать регистрационный номер последнего животного; 4.Обучить командам выбранное животное; " +
                    "5.Выйти из меню");
            try{
                if(scanner.hasNext()) {
                    int key = Integer.parseInt(scanner.nextLine());
                    switch (key) {
                        case 1:
                            animalView.showAnimals();
                            break;
                        case 2:
                            try {
                                System.out.println("Tрубется ввести: имя животного;возраст;" +
                                        "перечисления команд через ',';тип животного(" +
                                        "CAT/DOG/HUMSRTER/HORSE/CAMEL/DONKEY)");
                                String[] arr = scanner.nextLine().trim().split(";");
                                animalView.addAnimal(arr[0], Integer.parseInt(arr[1]),arr[2],arr[3]);
                            } catch (ArrayIndexOutOfBoundsException ex) {
                                System.out.println("Не верный ввод данных. " + ex.getMessage());
                            }catch (NumberFormatException ex) {
                                System.out.println("Нет таких");
                            }
                            break;
                        case 3:
                            animalView.showRegistrationResult();
                            break;
                        case 4:
                            try {
                                System.out.println("Tрубется ввести: регистрационный номер животного;" +
                                    "перечисления команд через ','");
                                String[] arr = scanner.nextLine().trim().split(";");
                                animalView.addNewCommand(Integer.parseInt(arr[0]),arr[1]);
                            } catch (ArrayIndexOutOfBoundsException ex) {
                                System.out.println("Не верный ввод данных. " + ex.getMessage());
                                }catch (NumberFormatException ex) {
                                System.out.println("Нет таких");
                            }
                            break;
                        case 5:
                            System.out.println("Пока!");
                            flag = false;
                            scanner.close();
                        default:
                            System.out.println("Мимо!");
                    }

                }
            }catch(NumberFormatException e){
                System.out.println("Ввод букв вместо цифр. Попробуй еще раз");
            }
        }

    }
}
