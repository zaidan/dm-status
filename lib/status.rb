require 'anima'
require 'assets'
require 'response'
require 'joy'
require 'susy'
require 'compass'
require 'haml'

Sass.load_paths.concat(Compass::Configuration::Data.new('foo').sass_load_paths)

# Namespace for dm-status
module Status

  # Return template path
  #
  # @return [Pathname]
  #
  # @api private
  #
  def self.template_path
    @template_path ||= root.join('templates').freeze
  end

  # Return template for name
  #
  # @param [String] name
  #
  # @return [Tilt::Template]
  # 
  # @api private
  #
  def self.template(name)
    Tilt.new(template_path.join(name).to_s)
  end

  # Return root directory
  #
  # @return [Pathname]
  #
  # @api private
  #
  def self.root
    @root ||= Pathname.new(__FILE__).parent.parent
  end

  repository  = Assets::Repository::Directory.new(root.join('assets'))

  rules = [
    Assets::Rule::Concat.build(
      'application.css', 
      repository.compile('stylesheets/screen.sass')
    ),
    Assets::Rule::Concat.build(
      'application.js', 
      repository.compile('js/tags.coffee')
    )
  ]

  ASSET_ENVIRONMENT = Assets::Environment::Dynamic.new(rules)

  ASSET_HANDLER = Assets::Handler.new(ASSET_ENVIRONMENT, '/assets/')

end

require 'status/tag'
require 'status/application'
require 'status/project'
require 'status/action'
require 'status/sponsor'
require 'status/member'
require 'status/context'
require 'status/builder'
require 'status/builder/updater'
