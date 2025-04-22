package RECURS02023;

import java.util.List;

public class GuestUser extends User {



    public GuestUser(int id, String userName) {
        super(id, userName);
        //TODO Auto-generated constructor stub
    }

    @Override
    public void registDigitalObject(DigitalObject obj) {}

    @Override
    public List<DigitalObject> getDigitalObjects() {
        return null;
    }
    
    
}
