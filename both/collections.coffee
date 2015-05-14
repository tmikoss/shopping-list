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
  undoneItemCount:
    type: Number
    autoform:
      omit: true
    autoValue: -> if @isInsert then 0 else @unset()

SL.ListItems = new Mongo.Collection 'list_items'
