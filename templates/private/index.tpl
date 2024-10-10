{include file='head.tpl'}

<body>
  <main>

    <h1>{$userName}</h1>
    <a href="logout">LOG OUT</a>

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