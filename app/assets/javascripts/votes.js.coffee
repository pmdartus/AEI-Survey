jQuery ->
  $('a[href^="#"]').click  -> 
    id = $(this).attr("href")
    offset = 60 ;
    target = $(id).offset().top - offset
    $('html, body').animate({scrollTop:target}, 500)
    event.preventDefault()
