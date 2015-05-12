Template.ListsCreateItem.events
  'click button': (e, tmpl) ->
    nameField = tmpl.$('input')
    name = nameField.val()

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

Template.ListItem.onRendered ->
  @autorun =>
    data = Template.currentData()

    @$('.item').hammer().off('swipe').on 'swipe', ->
      if data.done
        SL.ListItems.remove data._id
