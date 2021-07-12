-- Todo; fix compe error.
local neorg = require('neorg')
neorg.setup {
  -- Tell neorg what modules to load
  load = {
    ['core.defaults'] = {},         -- Load all default modules
    ['core.norg.concealer'] = {},    -- Allows for use of icons
    ['core.norg.dirman'] = {        -- Manage your directories with neorg
      config = {
        workspaces = {
          my_workspace = '~/neorg'
        }
      }
    }
  }
}
