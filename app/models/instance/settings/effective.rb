class Instance::Settings::Effective < Instance::Settings
  # @param (see Instance::Settings#initialize)
  # @param [#components] component_host The component host for which to query settings for.
  def initialize(settings, component_host)
    super(settings)
    @component_host = component_host
  end

  private

  # This overrides #components_enabled_statuses to merge in defaults from the component host.
  #
  # @return [Array<Instance::Settings::BooleanValue>] The enabled status for every component, and
  #   only every components which exist.
  def components_enabled_statuses
    existing_components = Set[*@component_host.components.map { |c| c.key.to_s }]
    enabled_statuses = super.select { |c| existing_components.include?(c.id) }

    augment_enabled_statuses_defaults(enabled_statuses)
  end

  # Augments the current array of enabled statuses with defaults for components which do not have
  # a configuration.
  #
  # @param [Array<Instance::Settings::BooleanValue>] enabled_statuses The array of enable statuses
  #   currently stored in the settings.
  # @return [Array<Instance::Settings::BooleanValue] The array of enable statuses with the defaults
  #   augmented for undefined components.
  def augment_enabled_statuses_defaults(enabled_statuses)
    enabled_statuses = enabled_statuses.dup
    configured_components = Set[*enabled_statuses.map(&:id)]

    @component_host.components.each do |component|
      next if configured_components.include?(component.key.to_s)
      id = component.key.to_s
      value = component.enabled_by_default?
      enabled_statuses << Instance::Settings::BooleanValue.new(id: id, value: value)
    end

    enabled_statuses
  end
end