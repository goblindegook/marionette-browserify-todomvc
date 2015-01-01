Marionette = require('backbone.marionette');

/**
 * Allows DustJS templates to be rendered on the default
 * Marionette flow.
 *
 * @param  {Function} template Precompiled Dustjs template.
 * @param  {Object}   data     View data.
 * @return {String}            Rendered template.
 */
Marionette.Renderer.render = function (template, data) {
    var html;

    if (!template) {
      throw new Marionette.Error({
        name: 'TemplateNotFoundError',
        message: 'Cannot render the template since its false, null or undefined.'
      });
    }

    template(data, function (err, out) {
        html = out;
    });

    return html;
};

module.exports = Marionette;
