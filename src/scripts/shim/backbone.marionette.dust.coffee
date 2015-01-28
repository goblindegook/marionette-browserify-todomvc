Marionette = require 'backbone.marionette'

###
Allows DustJS templates to be rendered on the default
Marionette flow.

@param  {Function} template Precompiled Dustjs template.
@param  {Object}   data     View data.
@return {String}            Rendered template.
###
Marionette.Renderer.render = (template, data) ->
  rendered = ''

  unless template
    throw new Marionette.Error
      name:    'TemplateNotFoundError'
      message: 'Cannot render the template since its false, null or undefined.'

  template(data, (err, out) -> rendered = out)

  return rendered

module.exports = Marionette
