# frozen_string_literal: true

require 'yaml'
# .rubocop.yml
module WorkWithYaml
  def self.w
    yaml_filename = 'parameters.yaml'
    params = YAML.safe_load(File.open(yaml_filename))
    puts params['filename'], params['url']
  end
end
