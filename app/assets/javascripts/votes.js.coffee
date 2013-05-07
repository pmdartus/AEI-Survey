jQuery ->
  $('a[href^="#"]').click  -> 
    id = $(this).attr("href")
    offset = 60 ;
    target = $(id).offset().top - offset
    $('html, body').animate({scrollTop:target}, 500)
    event.preventDefault()

  $('.btn-vote').click ->
    $('.btn-vote').removeClass('btn-info')
    $(this).addClass("btn-info")
    choice = parseInt($(this).attr('data-choice'))
    $('#vote_choice').val(choice)

  return
