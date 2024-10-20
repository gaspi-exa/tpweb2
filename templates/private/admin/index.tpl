{include file='../../head.tpl'}

<body>
  <main id="admin">
    <aside class="menu-container">
      <div class="menu">
        <div class="power-container">
          <button id="btn-power">
            <img src="./js/assets/icons/power.svg" />
          </button>
          <span class="user-name">{$userName}</span>
          <span class="user-name" style="color: lightblue;">ADMIN</span>
          <span id="user-id" style="display: none;">{$userId}</span>
        </div>

        <section class="actions">
          <button id="btn-table">
            <img src="./js/assets/icons/table.svg" />
          </button>
        </section>
      </div>
    </aside>

    <section class="arena-section">
      <div class="table-container">
        <table>
          <thead>
            <tr>
              {foreach from=$allUsers item=user}
                <th>
                  <div>
                    <select class="select-user" data-id="select-user-{$user}">
                      {foreach $allPokemons as $poke}
                        <option value="{$poke->_id}">
                          {$poke->name}
                        </option>
                      {/foreach}
                    </select>
                  </div>
                  <div>
                    {$user}
                  </div>
                </th>
              {/foreach}
            </tr>
          </thead>
          <tbody>
            {foreach from=$tableData item=row}
              <tr>
                {foreach from=$allUsers item=user}
                  <td>
                    {if $row[$user]}
                      <button class="btn-delete" data-id="{$row[$user]}">
                        X
                      </button>
                      <img class="img-modal" src="https://img.pokemondb.net/sprites/home/normal/{$row[$user]}.png" />
                    {/if}
                  </td>
                {/foreach}
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </section>
  </main>
</body>

</html>