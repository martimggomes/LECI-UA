package RECURS02023;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DigitalObject {
    private LocalDate date;
    private String doi;
    private SensitivityLevel slevel;
    private boolean isPublic;
    private String owner;
    private List<String> guests;


    public DigitalObject(String doi, SensitivityLevel slevel, boolean isPublic, String owner) {
        this.doi = doi;
        this.slevel = slevel;
        this.isPublic = isPublic;
        this.date = LocalDate.now();
        this.owner = owner;
        this.guests = new ArrayList<>();
        
    }


    public LocalDate getDate() {
        return date;
    }


    public String getDoi() {
        return doi;
    }


    public SensitivityLevel getSlevel() {
        return slevel;
    }


    public boolean isPublic() {
        return isPublic;
    }

    public void setSentivity(SensitivityLevel level){
        this.slevel = level;
    }


    public void setDate(LocalDate date) {
        this.date = date;
    }


    public void setDoi(String doi) {
        this.doi = doi;
    }


    public void setSlevel(SensitivityLevel slevel) {
        this.slevel = slevel;
    }


    public void setPublic(boolean isPublic) {
        this.isPublic = isPublic;
    }

    public void addGuest(String username){
        this.guests.add(username);
    }

    public List<String> getUsersWithAccess(){
        List<String> accessList = new ArrayList<>();
        accessList.add(owner);
        for(String username : this.guests){
            accessList.add(username);
        }
        return accessList;
    }

    public List<String> getGuestList(){
        return this.guests;
    }
    

    


}
