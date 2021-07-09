-- local snap = require'snap'

-- snap.register.map({"n"}, {"<Leader>g"}, function ()
--   snap.run {
--     producer = snap.get'consumer.fzy'(snap.get'producer.ripgrep.file'),
--     select = snap.get'select.file'.select,
--     multiselect = snap.get'select.file'.multiselect
--   }
-- end)

-- snap.register.map({"n"}, {"<Leader>gf"}, function ()
--   snap.run {
--     producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file'),
--     select = snap.get'select.file'.select,
--     multiselect = snap.get'select.file'.multiselect,
--     views = {snap.get'preview.file'}
--   }
-- end)
