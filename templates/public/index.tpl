<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <base href="{BASE_URL}">
  <title>Pokémon</title>
  <link rel="icon" href="public/assets/img/pokeball-dev.png" />
  {* google fonts *}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="static/styles/_index.css">
  {* <script src="public/main.js" type="module"></script> *}
</head>

<body>
  <main>

    <section class="table-section">
      {foreach $categories as $c}
        <div class="cat-row">
          <div class="cat-name">
            <h3>{$c->name}</h3>
          </div>
          <div class="d-flex scroll-x">
            {foreach $pokemons as $p}
              {if $p->category == $c->_id}
                <div class="poke-container">
                  <a href="#modal{$p->_id}">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{$p->_id}.png" />
                  </a>
                </div>

                <div id="modal{$p->_id}" class="modalmask">
                  <div class="modalbox rotate">
                    <a href="#close" title="Close" class="close">X</a>
                    <img class="img-modal" src="https://img.pokemondb.net/sprites/home/normal/{$p->name}.png" />
                    <div class="d-flex">
                      <div>
                        <h2>{$p->name|upper}</h2>
                        <p>{$c->name}</p>
                      </div>
                      <div>
                        <img class="img-modal" src="https://play.pokemonshowdown.com/sprites/xyani/{$p->name}.gif" />
                      </div>
                    </div>
                  </div>
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