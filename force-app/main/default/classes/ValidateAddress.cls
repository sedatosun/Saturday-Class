public class ValidateAddress {
    public void validateHomeAddress(){
        string housename = 'R210';
        string streetName = '300 Rogers Rd';
        string cityName = 'Athens';
        string stateName = 'Georgia';
        string stateIsoCode = 'GA';
        string countryName = 'United Stated';
        string countryIsoCode = 'US';

        integer streetNameLength = streetName.length();
        system.debug('Street Name length is ' + streetNameLength);

        Boolean streetNameContainsHouseName = streetName.contains(housename);
        system.debug('Street Name contains ' + streetNameContainsHouseName);

        Boolean streetNameContainsIsoCode = streetName.contains(stateIsoCode);
        system.debug('Street Name contains ' + streetNameContainsIsoCode);

        string stateIsoCodeUpper = stateIsoCode.toUpperCase();
        system.debug('State Iso Code Upper ' + stateIsoCodeUpper);
        string countryIsoCodeUpper = countryIsoCode.toUpperCase();
        system.debug('Country Iso Code Upper ' + countryIsoCodeUpper);
        string countryNameUpper = countryName.toUpperCase();
        system.debug('Country Name Upper ' + countryNameUpper);

        string cityNameLower = cityName.toLowerCase();
        system.debug('City Name Lower ' + cityNameLower);
        string stateNameLower = stateName.toLowerCase();
        system.debug('State Name Lower ' + stateNameLower);

        string concat = housename + ' ' + streetName + ' ' + cityName + ' ' + stateName + ' ' + stateIsoCode + ' ' + countryName + ' ' + countryIsoCode;
        system.debug(concat);
    }
}