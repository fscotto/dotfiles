local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh' }
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      {
         label = 'Git Bash',
         args = { 'C:\\Program Files\\Git\\bin\\bash.exe' },
      }
   }
elseif platform.is_mac or platform.is_linux then
   options.default_prog = { '/bin/zsh', '-l' }
   options.launch_menu = {
      { label = 'Zsh', args = { 'zsh', '-l' } },
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'zsh', '-l' }
   options.launch_menu = {
      { label = 'Zsh', args = { 'zsh', '-l' } },
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
   }
end

return options
