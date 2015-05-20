SL.ListItems = new Mongo.Collection 'list_items'

SL.ListItems.attachSchema new SimpleSchema
  name:
    type: String
  done:
    type: Boolean
  listId:
    type: String
  updatedAt:
    type: Date
  doneAt:
    type: Date
    optional: true

if Meteor.server
  SL.ListItems._ensureIndex { doneAt: 1 }, { expireAfterSeconds: 60*60 }
