package Pegas.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class Animals {
    private static int counter;
    private final int id;
    private final List<String> commands  = new ArrayList<>();
    {
        this.id = ++counter;
    }
    public List<String> getCommands() {
        return commands;
    }
    public int getId() {
        return id;
    }
}
