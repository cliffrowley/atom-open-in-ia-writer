exec = require("child_process").exec

{CompositeDisposable} = require 'atom'

module.exports = OpenInIaWriter =
  subscriptions: null

  config:
    application:
      type: 'string'
      default: 'iA Writer.app'

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-text-editor', 'open-in-ia-writer:open': => @open()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  open: ->
    path = atom.workspace.getActiveTextEditor()?.buffer?.file?.path
    app  = atom.config.get('open-in-ia-writer.application')

    console.log(app)

    exec "open -a \"#{app}\" \"#{path}\"" if path?
