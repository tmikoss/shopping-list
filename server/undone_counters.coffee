updateList = (document) ->
  count = SL.ListItems.find( listId: document.listId, done: false ).count()
  SL.Lists.update document.listId, { $set: { undoneItemCount: count } }, validate: false, getAutoValues: false

SL.ListItems.find({}, { fields: { listId: 1, done: 1 } }).observe
  added:   updateList
  changed: updateList
  removed: updateList
