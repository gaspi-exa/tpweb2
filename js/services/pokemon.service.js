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

  addPokemon = (userId, pokemonId) => {
    fetch(`${this.url}/addPokemon`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user_id: userId,
        pokemon_id: pokemonId,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data) {
          alert("Pokémon agregado exitosamente");
        } else {
          alert("Error al agregar Pokémon");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };
}

export default PokemonService;
