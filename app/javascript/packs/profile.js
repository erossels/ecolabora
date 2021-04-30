document.addEventListener("turbolinks:load", function() {
  $('.btn-modal').on('click', function(){
    $('#ProductModal').modal('show') 
  })  

  $('.btn-close-modal').on('click',function(){
    $('.modal').modal('hide')
  })

  $('.btn-modalKPI').on('click', function(){
    $('#KPIModal').modal('show') 
  })  

});

