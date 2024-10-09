<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Pokemon</title>
</head>

<body>
  <main>
    <section class="table-section">
      <table>
        <thead>
          <tr>
            {foreach $categories as $c}
              <th>
                {$c->name}
              </th>
            {/foreach}
          </tr>
        </thead>
        <tbody id="table-pokemon">
          <tr>
            {foreach $pokemons as $p}
              <td>
                <img src="https://img.pokemondb.net/sprites/silver/normal/{$p->name}.png" />
                </br>
                <p>
                  {$p->name}
                </p>
              </td>
            {/foreach}
          </tr>
        </tbody>
      </table>
    </section>
  </main>
</body>

</html>