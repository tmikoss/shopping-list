Template.ListUpdate.events
  'submit form': (e) ->
    form = e.target

    name = form.name.value

    if name
      SL.Lists.update @list._id, $set: { name: name }

      Router.go 'ListShow', _id: @list._id

    false

  'click [data-action="delete"]': (e) ->
    IonPopup.confirm
      title: 'Are you sure?'
      template: 'Are you <strong>really</strong> sure?'
      onOk: => SL.Lists.remove @list._id, -> Router.go 'ListIndex'
      okType: 'button-assertive'
