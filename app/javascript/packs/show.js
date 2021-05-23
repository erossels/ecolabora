document.addEventListener("turbolinks:load", function() {
  $('.btn-modal').on('click', function(){
    $('#PhotosModal').modal('show') 
  })  

  $('.btn-close-modal').on('click',function(){
    $('.modal').modal('hide')
  })

  $(".fa-paper-plane").on('click', function(){
    $(".fa-paper-plane").innerHTML = ''
    $(".msg_card_body").innerHTML = ''
    $(".msg_card_body").append("<%= escape_javascript(render partial: 'chats/show', locals: { chat: @chat } ) %>")
  }

});

