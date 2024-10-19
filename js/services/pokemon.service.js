class PokemonService {
  url = "http://localhost/tpw/api";

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
  
  async addPokemon(userId, pokemonId) {
    try {
      const response = await fetch(`${this.url}/addPokemon`, {
        method: "POST",
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
      console.error("Error:", error);
    }
  }
  


  getPokemonsByUser = async (userId) => {
    try {
      const response = await fetch(`${this.url}/getPokemonTeam`, {
        method: "GET",
        mode: "cors",
        body: JSON.stringify({
          user_id: userId,
        })
      });
  
      
      return await response.json();
    } catch (error) {
      console.error("Error fetching pokemons:", error);
      return [];
    }
  };
}



export default PokemonService;
