{include file='../../head.tpl'}

<body>
  <main id="arena">
    <aside class="menu-container">
      <div class="menu">
        <div class="power-container">
          <button id="btn-power">
            <img src="./js/assets/icons/power.svg" />
          </button>
          <span class="user-name">{$userName}</span>
          <span id="user-id" style="display: none;">{$userId}</span>
        </div>

        <section class="actions">
          <button id="btn-update">
            <img src="./js/assets/icons/update.svg" />
          </button>
          <button id="btn-table">
            <img src="./js/assets/icons/table.svg" />
          </button>
        </section>
      </div>
    </aside>

    <button class="pokeball-container" id="send">
      <img src="./js/assets/img/poke3.png" alt="Pokeball" />
    </button>

    <section class="arena-section">
      <div class="poke-container">
        {* <img id="random-pokemon" src="https://play.pokemonshowdown.com/sprites/xyani/zapdos.gif" /> *}
      </div>
    </section>

    <aside class="list">
      <div class="list-container">
        {foreach $pokemonsByUser as $poke}
          <div class="list-item">
            <div class="poke-item">
              <img src="https://play.pokemonshowdown.com/sprites/xyani/{$poke->name}.gif" alt="" />
            </div>
            <h1>{$poke->name}</h1>
            <button class="btn-delete" data-id="{$poke->_id}">F</button>
          </div>
        {/foreach}
      </div>
    </aside>
  </main>
</body>

</html>