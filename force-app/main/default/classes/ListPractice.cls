public class ListPractice {
    public static list<Planets> planetsList = new List<Planets>();
    public static string addPlanet(string Name, integer Number1, integer Moon) {
        string message;
        if(name !=''){
            Planets pl = new Planets();
            pl.name = Name;
            pl.planetNumber = Number1;
            pl.numberOfMoons = Moon;
            planetsList.add(pl); 
            message = ('Planet added successfully');
        } else {
            system.debug('Planet without a name cannot be added to list');
        }
        return message;
    }
}