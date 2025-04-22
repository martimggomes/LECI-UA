package POO2223;

import java.util.Objects;

public class CaravanSpace extends CampingSpace {

    public CaravanSpace(String location, int[] sizes, double pricePerNight) {
        super(location, sizes, pricePerNight);
        super.setSpaceType(SpaceType.CARAVAN);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CaravanSpace)) return false;
        return super.equals(o);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode());
    }
}
