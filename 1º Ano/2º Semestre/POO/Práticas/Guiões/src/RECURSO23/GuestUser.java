package RECURSO23;

public class GuestUser extends User {
    private static int numIds = -1;

    GuestUser(String name) {
        super(name);
        setId(numIds--);
    }
}
