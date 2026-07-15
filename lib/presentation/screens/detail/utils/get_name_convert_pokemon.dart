String getConvertNamePokemon({required String name}) =>
    name.length > 3 ? name.substring(0, 3) : name;
