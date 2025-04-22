package RECURS02023;

import java.util.List;

public abstract class User {
    private final int id;
    private final String userName;

    public User(int id, String userName) {
        this.id = id;
        this.userName = userName;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public abstract void registDigitalObject(DigitalObject obj);
    public abstract List<DigitalObject> getDigitalObjects();
    
}
