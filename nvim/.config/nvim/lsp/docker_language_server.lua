return {
    cmd = { "docker-language-server", "start", "--stdio" },
    filetypes = { "dockerfile", "yaml.docker-compose" },
    root_markers = { "Dockerfile", "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml", "docker-bake.json", "docker-bake.hcl", "docker-bake.override.json", "docker-bake.override.hcl" },
    get_language_id = function(_, ftype)
        if ftype == 'yaml.docker-compose' or ftype:lower():find('ya?ml') then
          return 'dockercompose'
        else
          return ftype
        end
      end,
}
