package RECURS02023;

import java.util.ArrayList;
import java.util.List;

public class RegisteredUser extends User {

    private List<DigitalObject> objs;

    public RegisteredUser(int id, String userName) {
        super(id, userName);
        objs = new ArrayList<>();
        //TODO Auto-generated constructor stub
    }

    @Override
    public void registDigitalObject(DigitalObject obj) {
        objs.add(obj);
    }

    @Override
    public List<DigitalObject> getDigitalObjects() {
       return this.objs;
    }
    
}
