class PokemonService {
  url = "http://localhost/projects/tpweb2/api";

  getPokemon = async (name) => {
    try {
      const resp = await fetch(`${this.url}/getPokemon/${name}`, {
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

  deletePokemon = async (pokemonId, userId) => {
    try {
      const response = await fetch(
        `${this.url}/deletePokemon/${pokemonId}/${userId}`,
        {
          method: "DELETE",
          mode: "cors",
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
      return await response.json();
    } catch (error) {
      alert("ERROR deleting pokemon", error);
    }
  };

  updatePokemon = async (pokemonId, rarity) => {
    try {
      const response = await fetch(`${this.url}/updateRarity/${pokemonId}`, {
        method: "PUT",
        mode: "cors",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          rarity,
        }),
      });
      return await response.json();
    } catch (error) {
      alert("ERROR updating pokemon", error);
    }
  };
}

export default PokemonService;
