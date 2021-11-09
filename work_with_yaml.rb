# frozen_string_literal: true

require 'yaml'
# .rubocop.yml
module WorkWithYaml
  # @return [Array]
  def self.read_parameters
    yaml_filename = 'parameters.yaml'
    params = YAML.safe_load(File.open(yaml_filename))
    [params['filename'].to_s, params['url'].to_s, params['product_per_page'].to_i]
  end
end
