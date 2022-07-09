// Entry point for the build script in your package.json
$(document).ready(function(){
  setTimeout(function(){
    $('.alert').fadeOut(function(){
      $(this).remove()
    })
  }, 5000)
})
