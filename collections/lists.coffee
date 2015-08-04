SL.Lists = new Mongo.Collection 'lists'

SL.Lists.attachSchema new SimpleSchema
  name:
    type: String
    max: 20
  userId:
    type: String
    autoform:
      omit: true
    autoValue: -> if @isInsert then @userId else @unset()
  sharedEmails:
    type: [String]
    label: 'Shared with'
    autoform:
      type: 'tags'
    optional: true
    regEx: SimpleSchema.RegEx.Email

if Meteor.isServer
  SL.Lists._ensureIndex { userId: 1 }
  SL.Lists._ensureIndex { sharedEmails: 1 }
