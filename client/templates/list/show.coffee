Template.ListShowCreateItem.events
  'submit form': (e) ->
    form = e.target
    name = form.name.value

    if name
      SL.ListItems.insert
        name: name
        listId: @list._id
        done: false
        updatedAt: new Date

      form.name.value = ''

    false

Template.ListShowItem.events
  "click [data-action='mark-as-done']": ->
    SL.ListItems.update @_id, $set: { done: true, updatedAt: new Date }

  "click [data-action='mark-as-not-done']": ->
    SL.ListItems.update @_id, $set: { done: false, updatedAt: new Date }

Template.ListShowItem.onRendered ->
  @autorun =>
    data = Template.currentData()

    @$('.item').hammer().off('swipe').on 'swipe', ->
      if data.done
        SL.ListItems.remove data._id
