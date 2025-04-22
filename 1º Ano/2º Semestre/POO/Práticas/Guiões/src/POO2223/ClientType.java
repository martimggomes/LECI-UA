package POO2223;

public enum ClientType {
    NORMAL, MEMBER;

    @Override
    public String toString() {
        return switch (this) {
            case NORMAL -> "Normal";
            case MEMBER -> "Member";
        };
    }
}
