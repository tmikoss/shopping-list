Template.ListItemShowButtons.events
  "click [data-action='mark-as-done']": ->
    SL.ListItems.update @_id, $set: { done: true, updatedAt: new Date }

  "click [data-action='mark-as-not-done']": ->
    SL.ListItems.update @_id, $set: { done: false, updatedAt: new Date }

Template.ListItemShow.onRendered ->
  @autorun =>
    data = Template.currentData()

    @$('.item').hammer().off('swipeleft').on 'swipeleft', ->
      if data.done
        SL.ListItems.remove data._id

Template.ListItemShow.helpers
  listName: -> SL.Lists.findOne(@listId)?.name
  itemClass: -> if @done then 'list-item__done' else 'list-item'
