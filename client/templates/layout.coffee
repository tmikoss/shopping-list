Template.LayoutContent.helpers
  navBarClass: -> if Meteor.status().connected then "bar-positive" else "bar-dark"
