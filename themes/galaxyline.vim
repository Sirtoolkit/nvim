lua << EOF
local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')

gl.short_line_list = {
    'LuaTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug'
}

-- VistaPlugin = extension.vista_nearest

local colors = {
    bg = '#3C3836',
    line_bg = '#504945',
    fg = '#EBDBB2',

    yellow = '#fabd2f',
    cyan = '#008080',

    green = '#afd700',
    orange = '#FF8800',
    red = '#ec5f67',

    magenta = '#c678dd',
    green_normal = '#B8BB26',
    blue = '#689D6A';

}

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end




local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

function get_function_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_current_func()
    end
  return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
          n = '',
          i = '',
          c= '',
          V= '',
          [''] = '',
          v ='',
          c  = '',
          ['r?'] = '',
          rm = '',
          R  = '',
          Rv = '',
          s  = '',
          S  = '',
          ['r']  = '',
          [''] = '',
          t  = '',
          ['!']  = '',
      }
      local mode_color = {
          n = colors.green_normal,
          i = colors.blue,
          v=colors.magenta,
          [''] = colors.blue,
          V=colors.blue,
          c = colors.red,
          no = colors.magenta,
          s = colors.orange,
          S=colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.blue,
          Rv = colors.blue,
          cv = colors.red,
          ce=colors.red, 
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!']  = colors.green,
          t = colors.green,
          c  = colors.blue,
          ['r?'] = colors.red,
          ['r']  = colors.red,
          rm = colors.red,
          R  = colors.yellow,
          Rv = colors.magenta,
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
      return alias[vim_mode] .. '▋   '
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg,'bold'}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.line_bg,colors.line_bg}
  }
}

gls.left[11] = {
Space2 = {
    provider = function() return ' ' end,
    highlight = {colors.bg,colors.bg}
  }
}



gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.line_bg,'bold'},
  }
}

gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.fg,colors.line_bg},
  },
}

gls.right[5] = {
Heart = {
    provider = function() return ' ' end,
    separator = ' | ',
    separator_highlight = {colors.blue,colors.line_bg},
    highlight = {colors.green_normal,colors.line_bg},
  }
}


gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    condition = has_file_type,
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.blue}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    condition = has_file_type,
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.blue}
  }
}
EOF
