/*
 * caminio
 * (c) 2014 by TASTENWERK
 * license: GPLv3
 *
 */

  
var jsonSelect = require('mongoose-json-select')
  , MessageSchema = require('./schemas/message')
  , caminio = require('../../lib/caminio');

var GroupSchema = caminio.orm.Schema({
    name: { type: String, required: true },
    users: [ { type: caminio.orm.Schema.Types.ObjectId, ref: 'User' } ],
    messages: [ MessageSchema ],
    domains: [{ type: caminio.orm.Schema.Types.ObjectId, ref: 'Domain' } ],
    created: { 
      at: { type: Date, default: Date.now },
      by: { type: caminio.orm.Schema.Types.ObjectId, ref: 'User' }
    },
    updated: { 
      at: { type: Date, default: Date.now },
      by: { type: caminio.orm.Schema.Types.ObjectId, ref: 'User' }
    },
    description: String,
});

module.exports = GroupSchema;