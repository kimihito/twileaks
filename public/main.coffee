$ ->
  $("#text").keyup ->
    $('#count').text(130 - $("#text").val().length)
