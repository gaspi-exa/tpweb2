class PokemonService {
  url = "http://localhost/projects/tpweb2/api";

  getRandomPokemon = async () => {
    try {
      const resp = await fetch(`${this.url}/getRandomPokemon`, {
        method: "GET",
        mode: "cors",
      });

      if (!resp.ok) {
        throw new Error(`HTTP error! status: ${resp.status}`);
      }

      return await resp.json();
    } catch (error) {
      console.error("Error fetching pokemons:", error);
      return [];
    }
  };

  addPokemon = async (userId, pokemonId) => {
    try {
      const response = await fetch(`${this.url}/addPokemon`, {
        method: "POST",
        mode: "cors",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          user_id: userId,
          pokemon_id: pokemonId,
        }),
      });
      return await response.json();
    } catch (error) {
      alert("ERROR adding pokemon", error);
    }
  };

  getPokemonsByUser = async (userId) => {
    try {
      const response = await fetch(`${this.url}/getPokemonTeam/${userId}`, {
        method: "GET",
        mode: "cors",
      });

      return await response.json();
    } catch (error) {
      console.error("Error fetching pokemons:", error);
    }
  };
}

export default PokemonService;
