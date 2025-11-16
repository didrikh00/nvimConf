-- Git signs toggle function

local git_signs_enabled = true
function _G.toggle_gitsigns()
  git_signs_enabled = not git_signs_enabled
  if git_signs_enabled then
    require("gitsigns").toggle_signs(true)
    print("Git signs enabled")
  else
    require("gitsigns").toggle_signs(true)
    print("Git signs enabled")
  end
end
