function addPokemon(userId, pokemonId) {
    // Configura la solicitud POST al servidor
    fetch('/add-pokemon.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        user_id: userId,
        pokemon_id: pokemonId,
      }),
    })
    .then(response => response.json())  // Respuesta en JSON
    .then(data => {
      if (data.success) {
        alert('Pokémon agregado exitosamente');
      } else {
        alert('Error al agregar Pokémon');
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }