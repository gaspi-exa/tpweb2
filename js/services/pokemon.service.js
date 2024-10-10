class PokemonService {
  getPokemons = async () => {
    try {
      const resp = await fetch(
        `http://localhost/_TPWEB/api/pokemons/`,
        {
          method: "GET",
          mode: "cors",
        }
      );

      if (!resp.ok) {
        throw new Error(`HTTP error! status: ${resp.status}`);
      }

      return await resp.json();
    } catch (error) {
      console.error("Error fetching pokemons:", error);
      return [];
    }
  };
}

export default PokemonService;
