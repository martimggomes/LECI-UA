package POO2223;

public class TentSpace extends CampingSpace {

    public TentSpace(String location, int[] sizes, double pricePerNight) {
        super(location, sizes, pricePerNight);
        super.setSpaceType(SpaceType.TENT);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TentSpace)) return false;
        return super.equals(o);
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }
}
