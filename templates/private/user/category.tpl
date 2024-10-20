{include file='head.tpl'}

<body>
  <div class="modal hidden" id="modal">
    <div class="modal-container" id="modal">
      <button id="btn-close-modal" class="close">X</button>
      <img class="img-modal-big" id="pokemon-img" />
      <div class="d-flex">
        <div class="d-flex">
          <div id="pokemon-data">
          </div>
          <div class="gif-container">
            <img class="img-modal" id="pokemon-gif" />
          </div>
        </div>
      </div>
    </div>
  </div>

  <main id="categories">
    <button id="btn-back" class="btn-back">
      <- </button>
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
                      <div class="pokemon-item" data-id="{$p->name}">
                        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{$p->_id}.png" />
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