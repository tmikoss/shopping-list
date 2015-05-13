Template.ListUpdate.events
  'click [data-action="delete"]': (e) ->
    IonPopup.confirm
      title: 'Are you sure?'
      template: 'Are you <strong>really</strong> sure?'
      onOk: => SL.Lists.remove @list._id, -> Router.go 'ListIndex'
      okType: 'button-assertive'
