package RECURS02023;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DigitalAssetManager implements DigitalAssetManagerInterface {

    Map<String, User> registeredUsers;
    private int lastRegisteredUserId;
    private int lastGuestUserId;

    public DigitalAssetManager(){

        this.registeredUsers = new HashMap<String, User>();
        this.lastRegisteredUserId = 0;
        this.lastGuestUserId = -1;
    }

    @Override
    public User registerUser(String userName) {
        User user = new RegisteredUser(lastRegisteredUserId, userName);
        lastRegisteredUserId++;
        registeredUsers.put(userName, user);
        return user;
        
    }

    @Override
    public User getUser(String userName) {
        return registeredUsers.get(userName);
    }

    @Override
    public User createGuestUser() {
       int id = lastGuestUserId;
       lastGuestUserId--;
       String username = String.format("GUEST#%d", id*-1);
       User user = new GuestUser(id, username);
       return user;
    }

    @Override
    public DigitalObject registerDigitalObject(String doi, User owner) {
        return registerDigitalObject(doi, SensitivityLevel.PERSONAL, owner);
    }

    @Override
    public DigitalObject registerDigitalObject(String doi, SensitivityLevel sensitivityLevel, User owner) {
       boolean isPublic = sensitivityLevel!=SensitivityLevel.PERSONAL;
 
       DigitalObject obj = new DigitalObject(doi, sensitivityLevel, isPublic, owner.getUserName());
       owner.registDigitalObject(obj);
       return obj;
    }

    @Override
    public List<String> listRegisteredUsers() {
        List<String> users = new ArrayList<>();
        for(String username:  registeredUsers.keySet()){
            users.add(username);
        }
        return users;
    }

    @Override
    public List<String> listUserObjects(User u) {
        List<String> dois = new ArrayList<>();
        for(DigitalObject obj: u.getDigitalObjects()){

            //dois.add(obj.getDoi());
            String doi = obj.getDoi();
            dois.add(doi);
        }
        return dois;

    }

    @Override
    public boolean setObjectSensitivity(String doi, SensitivityLevel sensitivityLevel, User owner) {
        //1. pedir ao owner os DigitalObjects que ele tem
        List<DigitalObject> lista_obj = owner.getDigitalObjects();

        //2. iterar sobre os digitalObjects até encontrar o digital object que tem um DOI igual à variavel doi
        for (DigitalObject dobj : lista_obj) {
            if(dobj.getDoi().equals(doi)){
                 //3.fazer setSensitivity sobre o objeto desse DigitalObject
                 dobj.setSentivity(sensitivityLevel);
                 return true;
            }
        }
        return false;

       
    }

    @Override
    public boolean setPublic(String doi, User owner) {
        List<DigitalObject> lista_obj = owner.getDigitalObjects();

        //2. iterar sobre os digitalObjects até encontrar o digital object que tem um DOI igual à variavel doi
        for (DigitalObject dobj : lista_obj) {
            if(dobj.getDoi().equals(doi)){
                 //3.fazer setSensitivity sobre o objeto desse DigitalObject
                 dobj.setPublic(true);
                 return true;
            }
        }
        return false;
    }

    @Override
    public boolean shareObject(String doi, User owner, User otherUser) {
        DigitalObject obj = getObject(doi, owner);
        if(obj!= null && obj.getSlevel()!= SensitivityLevel.PERSONAL){
            obj.addGuest(otherUser.getUserName());
            return true;
        }

        return false;
    }

    @Override
    public DigitalObject getObject(String doi, User user) {
        List<DigitalObject> lista_obj = user.getDigitalObjects();

        //2. iterar sobre os digitalObjects até encontrar o digital object que tem um DOI igual à variavel doi
        for (DigitalObject dobj : lista_obj) {
            if(dobj.getDoi().equals(doi)){
                return dobj;
            }
        }

        return null;
    }

    @Override
    public List<String> listUsersWithObjectAccess(String doi) {
        for(String username: listRegisteredUsers()){
            User user = getUser(username);
            DigitalObject dobj = getObject(doi, user);
            if(dobj != null){
                return dobj.getUsersWithAccess();
            }

        }
        return null;


    }

    @Override
    public List<DigitalObject> listObjectSharedWithUser(User u) {

        List<DigitalObject> dobjs = new ArrayList<>();

        for(String username: listRegisteredUsers()){
            User user = getUser(username);
            for(DigitalObject obj: user.getDigitalObjects()){
                if( obj.getGuestList().contains(u.getUserName()) ){
                    dobjs.add(obj);
                }
               
            }

        }
        return dobjs;


    }
    
}
