$(document).ready ->
  current_tab = $('#current_tab').val()
  unless current_tab
    current_tab = "#basics"
  $("a[href='#{current_tab}']").parent().addClass("active")
  $("#{current_tab}").addClass("active")

  $("a[data-toggle='tab']").click ->
    tab_name = $(this).attr('href').replace("#", "")
    uri      = "#{tab_name}/change_tab"
    $.ajax
      url: uri
      type: "POST"