Template.ListsCreateItem.events
  'click button': (e, tmpl) ->
    nameField = tmpl.$('input')
    name = nameField.val()

    console.log @list

    if name
      SL.ListItems.insert
        name: name
        listId: @list._id
        done: false
        updatedAt: new Date

      nameField.val('')

    false

Template.ListItem.events
  "click [data-action='mark-as-done']": ->
    SL.ListItems.update @_id, $set: { done: true, updatedAt: new Date }

  "click [data-action='mark-as-not-done']": ->
    SL.ListItems.update @_id, $set: { done: false, updatedAt: new Date }
