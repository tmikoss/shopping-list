Template.ListCreate.events
  'submit form': (e) ->
    form = e.target

    SL.Lists.insert
      name: form.name.value

    form.reset()

    false

Template.ListShow.helpers
  listItems: -> SL.ListItems.find { listId: @_id }, { sort: { done: 1, createdAt: -1 } }

Template.ListShow.events
  "submit form": (e) ->
    form = e.target

    SL.ListItems.insert
      name: form.name.value
      listId: @_id
      done: false
      createdAt: new Date

    form.reset()

    false

Template.ListItem.events
  "click [data-action='mark-as-done']": ->
    SL.ListItems.update @_id, $set: { done: true }

  "click [data-action='mark-as-not-done']": ->
    SL.ListItems.update @_id, $set: { done: false }
