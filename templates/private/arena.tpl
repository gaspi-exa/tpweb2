{include file='../head.tpl'}

<body>
  <main>
    <aside class="menu-container">
      <div class="menu">
        <div class="power-container">
          <button id="btn-power">
            <img src="./js/assets/icons/power.svg" />
          </button>
          <span class="user-name">{$userName}</span>
        </div>

        <section class="actions">
          <button id="btn-table">
            <img src="./js/assets/icons/table.svg" />
          </button>
          <button id="btn-update">
            <img src="./js/assets/icons/update.svg" />
          </button>
        </section>
      </div>
    </aside>

    <button class="pokeball-container">
    <img src="./js/assets/img/poke2.png" alt="Pokeball" />
  </button>
  
  <section class="arena-section">
    <div class="poke-container">
      <img src="https://play.pokemonshowdown.com/sprites/xyani/zapdos.gif" alt="Zapdos" />
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
          </div>
        {/foreach}
      </div>
    </aside>
  </main>
</body>

</html>