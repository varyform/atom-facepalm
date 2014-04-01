# Engage Facepalm-mode:
#
# 1. Always, if no activation events are configured (the default).
# 2. On any of a set of activation events.
# 3. On a command palette command.

{Subscriber} = require 'emissary'

CONFIG_ACTIVATION = 'atom-facepalm.activationEvents'
CONFIG_DEACTIVATION = 'atom-facepalm.deactivationEvents'

class Facepalm
  Subscriber.includeInto @

  on: ->
    atom.config.observe CONFIG_ACTIVATION, => @updateSubscriptions()
    atom.config.observe CONFIG_DEACTIVATION, => @updateSubscriptions()

  off: ->
    @unsubscribe()
    atom.config.unobserve CONFIG_ACTIVATION
    atom.config.unobserve CONFIG_DEACTIVATION

  updateSubscriptions: ->
    @unsubscribe()
    activations = atom.config.get CONFIG_ACTIVATION

    if activations.trim().length is 0
      @engage()
    else
      @subscribe atom, activations, => @engage()

    deactivations = atom.config.get CONFIG_DEACTIVATION
    @subscribe atom, deactivations, => @disengage()

  engage: ->
    @watcher = atom.workspaceView.eachEditorView (view) =>
      view.addClass 'facepalm'

  disengage: ->
    @watcher.off() if @watcher
    for view in atom.workspaceView.getEditorViews()
      view.removeClass 'facepalm'

module.exports =

  activate: ->
    @inst = new Facepalm
    @inst.on()

  deactivate: ->
    @inst.off()

  configDefaults:
    activationEvents: ''
    deactivationEvents: ''
