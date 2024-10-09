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
      {foreach $categories as $c}
        <div style="display: flex; border: 1px solid">
          <h3>{$c->name}</h3>
          <div style="display: flex;">
            {foreach $pokemons as $p}
              {if $p->category == $c->_id}
                <div style="width: 100px">
                  <img src="https://img.pokemondb.net/sprites/silver/normal/{$p->name}.png" />
                  </br>
                  <p>
                    {$p->name}
                  </p>
                </div>
              {/if}
            {/foreach}
          </div>
        </div>
      {/foreach}
    </section>
  </main>
</body>

</html>