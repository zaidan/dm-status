(($) ->
  showTag = (tag, table, reset) ->
    $(table).find("a:not(:Contains(" + tag + "))").parent().parent().slideUp()
    $(table).find("a:Contains(" + tag + ")").parent().parent().slideDown()
    reset.show()

  showAll = (table, reset) ->
    $(table).find("tr").slideDown()
    reset.hide()

  @showTag = (tag) ->
    showTag(tag, $("#projects"), $("#reset"))

  @show = () ->
    showAll($("#projects"), $("#reset"))

  $ ->
    show()

) jQuery
