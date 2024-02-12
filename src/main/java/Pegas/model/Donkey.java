package Pegas.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Donkey extends Animals{
    private static int count = 1000;
    private final int number;
    private String name;
    private int age;
    public Donkey(String name, int age, String str) {
        this.name = name;
        this.age = age;
        this.number = ++count;
        addCommand(str);
    }
    public void addCommand(String str){
        String[] arr= str.trim().split(",");
        getCommands().addAll(Arrays.asList(arr));
    }
    public int getNumber() {
        return number;
    }
    public String getName() {
        return name;
    }
    public int getAge() {
        return age;
    }
    @Override
    public String toString() {
        return "Donkey{" +
                "number=" + number +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", commands=" + getCommands()+
                '}';
    }
}
