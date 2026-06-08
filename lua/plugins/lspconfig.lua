
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    -- ==========================================
    -- Vue + React + TypeScript: vtsls + vue_ls
    -- @see: https://github.com/vuejs/language-tools/wiki/Neovim
    -- ==========================================

    local vue_plugin_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local tsserver_filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
    }

    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_plugin_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }

    -- vtsls: TypeScript / JavaScript / Vue 的 TS 支持
    vim.lsp.config("vtsls", {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = { vue_plugin },
          },
        },
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "all" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },
        javascript = {
          inlayHints = {
            parameterNames = { enabled = "all" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
        },
      },
      filetypes = tsserver_filetypes,
      -- Since 3.0.2, semantic tokens are handled on the vue_ls side.
      -- Disable vtsls semantic tokens for Vue files to avoid conflict.
      on_attach = function(client)
        local cap = client.server_capabilities
        if cap.semanticTokensProvider then
          if vim.bo.filetype == "vue" then
            cap.semanticTokensProvider.full = false
          else
            cap.semanticTokensProvider.full = true
          end
        end
      end,
    })

    -- vue_ls: Vue 专属 LSP
    -- 需要手动桥接 vtsls / ts_ls 的 tsserver 请求
    vim.lsp.config("vue_ls", {
      on_init = function(client)
        client.handlers["tsserver/request"] = function(_, result, context)
          local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })
          local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
          local clients = {}

          vim.list_extend(clients, ts_clients)
          vim.list_extend(clients, vtsls_clients)

          if #clients == 0 then
            vim.notify(
              "Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.",
              vim.log.levels.ERROR
            )
            return
          end

          local ts_client = clients[1]
          local param = unpack(result)
          local id, command, payload = unpack(param)

          ts_client:exec_cmd({
            title = "vue_request_forward",
            command = "typescript.tsserverRequest",
            arguments = { command, payload },
          }, { bufnr = context.bufnr }, function(_, r)
            local response = r and r.body
            -- NOTE: Do NOT return if there's an error or no response,
            -- just return nil back to the vue_ls to prevent memory leak.
            local response_data = { { id, response } }

            ---@diagnostic disable-next-line: param-type-mismatch
            client:notify("tsserver/response", response_data)
          end)
        end
      end,
    })

    -- jsonls: JSON 支持（含 SchemaStore）
    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- 启用所有 LSP 服务器
    vim.lsp.enable({
      "html",
      "cssls",
      "jsonls",
      "vtsls",
      "vue_ls",
      "tailwindcss",
    })
  end,
}
